package com.example.primehotels.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class FacilityListEntity {
    private int facilityListId;
    private String name;
    private int facilityId;
}
