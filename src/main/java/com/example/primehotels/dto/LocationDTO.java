package com.example.primehotels.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class LocationDTO {
    private int locationId;
    private String name;
    private Integer parentId;
    private String type;
}
