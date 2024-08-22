package com.security.security.model;
import jakarta.persistence.*;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Entity
@Table(name = "personal_details")
@Data
@ToString

public class PersonalDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long personalDetailsId;
    private String rank;
    private String regiment;
    private String name;
    private Date dateOfBirth;
    private String fatherName;
    private String educationalQualification;
    private String religion;
    private String caste;
    private String address;
    private String tehsil;
    private String phone;
}
