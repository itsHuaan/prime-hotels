package com.example.primehotels.model;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class InvoiceModel {
    private String invoiceId;
    private String reservationId;
    private Date invoiceDate;
    private double totalPrice;
    private String paymentId;
}
