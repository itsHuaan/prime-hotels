package com.example.primehotels.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class LocationModel {
    private int locationId;
    private String name;
    private Integer parentId;
    private String type;
}
