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
    private Date checkIn;
    private Date checkOut;
    private Date reserveDate;
    private double deposit;
    private String status;
}
