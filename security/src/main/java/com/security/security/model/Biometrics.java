package com.security.security.model;

import jakarta.persistence.*;

@Entity
@Table(name="Biometrics")
public class Biometrics {
    @Id
    private byte[] identificationMark;
    private byte[] leftThumb;

    @OneToOne
    @JoinColumn(name = "armyNumber")
    private PersonalDetails personalDetails;
}
