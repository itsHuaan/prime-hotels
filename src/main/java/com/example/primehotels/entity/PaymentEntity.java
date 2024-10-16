package com.example.primehotels.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class PaymentEntity {
    private String paymentId;
    private String paymentType;
    private Double rating;
    private String comment;
}
