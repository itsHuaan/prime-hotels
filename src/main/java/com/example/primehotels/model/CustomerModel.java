package com.example.primehotels.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CustomerModel {
    private String customerId;
    private String name;
    private String tel;
    private String email;
}
