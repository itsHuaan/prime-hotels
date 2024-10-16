package com.example.primehotels.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class InvoiceDTO {
    private String invoiceId;
    private String reservationId;
    private Date invoiceDate;
    private double totalPrice;
    private String paymentId;
}
