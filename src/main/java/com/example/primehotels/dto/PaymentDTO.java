package com.example.primehotels.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class PaymentDTO {
    private String paymentId;
    private String paymentType;
    private Double rating;
    private String comment;
}
