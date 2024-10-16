package com.example.primehotels.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CustomerDTO {
    private String customerId;
    private String name;
    private String tel;
    private String email;
}
