package com.security.security.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.ToString;

import java.util.Date;
@Entity
@Table(name = "professional_details")
@Data
@ToString

public class ProfessionalDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long professionalId;
    private String decoration;
    private String character;
    private Date dateOfEnrollment;
    private Date dateOfDischarge;
    private String reasonOfDischarge;
    private Float amountOfPension;
    private Float amountofDisabilityPension;
    private Float lumpSum;
    private Float gratuity;
    private Float groupInsurance;
    private Float leaveEncashment;
    private Float financialAssiastance;
    private Float commutedPension;
    private Float dischargeBookNo;
    private Date dischargeBook;
    private Float ppoNo;
    private Date ppo;
    private String occupation;
    private Float income;

//    @ManyToOne
//    @JoinColumn(name="armyNumber")
//    private PersonnelDetails personnelDetails;


}
