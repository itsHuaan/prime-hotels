package com.example.primehotels.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class HotelEntity {
    private String hotelId;
    private String name;
    private int locationId;
    private String address;
    private String description;
    private int roomAvailable;
    private String image;
    private double price;
    private double rating;
    private boolean status;
    private int facilityListId;
}
