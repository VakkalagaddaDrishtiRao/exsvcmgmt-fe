package com.security.security.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Status {
    @Id
    private String name;
    private String password;

    @ManyToOne
    @JoinColumn(name="armyNumber")
    private PersonalDetails personalDetails;
}
