<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Razorpay Checkout</title>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    min-height: 100vh;
    display: grid;
    place-items: center;
    background: linear-gradient(90deg, #1f7a82, #2a9aa3);
}
.card {
    width: 90%;
    max-width: 520px;
    background: #f5f8f8;
    border-radius: 14px;
    padding: 22px;
    box-shadow: 0 10px 24px rgba(0, 0, 0, 0.15);
}
h2 { margin-top: 0; }
.meta { color: #335; margin: 8px 0; }
button {
    border: none;
    background: #1b6f75;
    color: #fff;
    padding: 10px 14px;
    border-radius: 8px;
    cursor: pointer;
}
.link {
    margin-left: 10px;
    color: #1b6f75;
    text-decoration: none;
    font-weight: 600;
}
</style>
</head>
<body>
<div class="card">
    <h2>Redirecting To Razorpay</h2>
    <p class="meta">Student: ${studentName}</p>
    <p class="meta">Role: ${jobRole}</p>
    <p class="meta">Amount: ${currency} ${amountInPaise / 100}</p>
    <button type="button" id="payNowBtn">Open Razorpay</button>
    <a class="link" href="${pageContext.request.contextPath}/companyPayment">Cancel</a>
</div>

<script>
(function () {
    var options = {
        key: "${razorpayKeyId}",
        amount: "${amountInPaise}",
        currency: "${currency}",
        name: "TalentTalk",
        description: "Payment for ${jobRole}",
        order_id: "${razorpayOrderId}",
        prefill: {
            name: "${companyName}",
            email: "${companyEmail}"
        },
        theme: {
            color: "#1b6f75"
        },
        modal: {
            ondismiss: function () {
                window.location.href = "${pageContext.request.contextPath}/companyPayment";
            }
        },
        handler: function (response) {
            var form = document.createElement("form");
            form.method = "POST";
            form.action = "${pageContext.request.contextPath}/companyPayment/verify";

            var fields = {
                razorpay_payment_id: response.razorpay_payment_id,
                razorpay_order_id: response.razorpay_order_id,
                razorpay_signature: response.razorpay_signature
            };

            Object.keys(fields).forEach(function (key) {
                var input = document.createElement("input");
                input.type = "hidden";
                input.name = key;
                input.value = fields[key];
                form.appendChild(input);
            });

            document.body.appendChild(form);
            form.submit();
        }
    };

    var rzp = new Razorpay(options);
    document.getElementById("payNowBtn").addEventListener("click", function () {
        rzp.open();
    });

    // Auto-open for smooth redirect experience
    window.addEventListener("load", function () {
        rzp.open();
    });
})();
</script>
</body>
</html>
