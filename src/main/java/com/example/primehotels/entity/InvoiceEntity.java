package com.example.primehotels.entity;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class InvoiceEntity {
    private String invoiceId;
    private String reservationId;
    private java.sql.Timestamp createdAt;
    private double totalPrice;
    private String paymentId;
}
