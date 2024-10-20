package com.example.primehotels.dto;

import lombok.*;

import java.time.LocalDateTime;
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
    private LocalDateTime createdAt;
    private double totalPrice;
    private String paymentId;
}
