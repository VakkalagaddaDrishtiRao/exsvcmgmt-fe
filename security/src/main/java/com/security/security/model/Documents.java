package com.security.security.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Documents {
    @Id
    private Long docsId;
    private byte[] dischargeBook;
    private byte[] PPO;
    private byte[] passportPhoto;
    private byte[] PAN;
    private byte[] EPIC;
    private byte[] adhaar;
}
