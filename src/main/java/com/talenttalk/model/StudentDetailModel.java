package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@Entity
@Table(name = "students")
public class StudentDetailModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // These names now match the "name" attributes in your JSP
    private String firstName;
    private String lastName;
    @Column(unique = true, nullable = false)
    private String email;
    private String password;
    private String address;
    private String profession;

    @Lob
    @Column(columnDefinition = "MEDIUMBLOB")
    private byte[] resume; // To store the file content
    private String resumeFileType;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<JobApplication> applications;

    @Column(name = "reset_token")
    private String resetToken;

}