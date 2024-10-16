package com.example.primehotels.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class FacilityListDTO {
    private int facilityListId;
    private String name;
    private int facilityId;
}
