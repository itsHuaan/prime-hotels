package com.example.primehotels.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class PaymentModel {
    private String paymentId;
    private String paymentType;
    private Double rating;
    private String comment;
}
