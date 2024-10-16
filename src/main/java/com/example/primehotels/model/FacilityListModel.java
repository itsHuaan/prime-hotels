package com.example.primehotels.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class FacilityListModel {
    private int facilityListId;
    private String name;
    private int facilityId;
}
