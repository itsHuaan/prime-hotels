package com.example.primehotels.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class LocationEntity {
    private int locationId;
    private String name;
    private Integer parentId;
    private String type;
}
