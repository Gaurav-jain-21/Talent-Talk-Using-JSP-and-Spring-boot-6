package com.talenttalk.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@Service
public class RazorpayPaymentService {

    @Value("${razorpay.key.id:}")
    private String keyId;

    @Value("${razorpay.key.secret:}")
    private String keySecret;

    @Value("${razorpay.currency:INR}")
    private String currency;

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final HttpClient httpClient = HttpClient.newHttpClient();

    public Map<String, String> createOrder(Long appId, Long companyId, int amountRupees) {
        validateCredentials();

        int safeAmount = Math.max(amountRupees, 1);
        int amountInPaise = safeAmount * 100;

        Map<String, Object> payload = new HashMap<>();
        payload.put("amount", amountInPaise);
        payload.put("currency", currency);
        payload.put("receipt", "app_" + appId + "_cmp_" + companyId + "_" + System.currentTimeMillis());

        Map<String, String> notes = new HashMap<>();
        notes.put("applicationId", String.valueOf(appId));
        notes.put("companyId", String.valueOf(companyId));
        payload.put("notes", notes);

        try {
            String jsonPayload = objectMapper.writeValueAsString(payload);
            String authValue = Base64.getEncoder().encodeToString((keyId + ":" + keySecret).getBytes(StandardCharsets.UTF_8));

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://api.razorpay.com/v1/orders"))
                    .header("Authorization", "Basic " + authValue)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonPayload))
                    .build();

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() < 200 || response.statusCode() >= 300) {
                throw new IllegalStateException("Unable to create Razorpay order. HTTP " + response.statusCode());
            }

            JsonNode root = objectMapper.readTree(response.body());
            String orderId = root.path("id").asText();
            if (orderId == null || orderId.isBlank()) {
                throw new IllegalStateException("Razorpay order id is missing in response.");
            }

            Map<String, String> result = new HashMap<>();
            result.put("orderId", orderId);
            result.put("amountInPaise", String.valueOf(amountInPaise));
            result.put("currency", currency);
            result.put("keyId", keyId);
            return result;
        } catch (Exception ex) {
            throw new IllegalStateException("Failed to communicate with Razorpay: " + ex.getMessage(), ex);
        }
    }

    public boolean verifySignature(String razorpayOrderId, String razorpayPaymentId, String razorpaySignature) {
        validateCredentials();
        try {
            String payload = razorpayOrderId + "|" + razorpayPaymentId;
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(new SecretKeySpec(keySecret.getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
            byte[] digest = mac.doFinal(payload.getBytes(StandardCharsets.UTF_8));
            String generatedSignature = toHex(digest);

            return MessageDigest.isEqual(
                    generatedSignature.getBytes(StandardCharsets.UTF_8),
                    razorpaySignature.getBytes(StandardCharsets.UTF_8)
            );
        } catch (Exception ex) {
            return false;
        }
    }

    private void validateCredentials() {
        if (keyId == null || keyId.isBlank() || keySecret == null || keySecret.isBlank()) {
            throw new IllegalStateException("Razorpay key id/secret is not configured.");
        }
    }

    private String toHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
