package com.example.primehotels.entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ReservationEntity {
    private String reservationId;
    private String customerId;
    private String hotelId;
    private java.sql.Date checkIn;
    private java.sql.Date checkOut;
    private java.sql.Date reserveDate;
    private double deposit;
    private int status = 1;
}
