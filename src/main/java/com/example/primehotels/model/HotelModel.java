package com.example.primehotels.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class HotelModel {
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
