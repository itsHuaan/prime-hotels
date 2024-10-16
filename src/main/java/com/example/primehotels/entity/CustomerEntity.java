package com.example.primehotels.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CustomerEntity {
    private String customerId;
    private String name;
    private String tel;
    private String email;
}
