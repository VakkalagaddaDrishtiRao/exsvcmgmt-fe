package com.security.security.model;

import jakarta.persistence.*;

@Entity
public class grievance {
    @Id
    private String name;
    private String email;
    private String message;
    private byte[] picture;

    @ManyToOne
    @JoinColumn(name = "armyNumber")
    private PersonalDetails personalDetails;
}

