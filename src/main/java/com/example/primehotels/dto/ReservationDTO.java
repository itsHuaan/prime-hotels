package com.example.primehotels.dto;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ReservationDTO {
    private String reservationId;
    private String customerId;
    private String hotelId;
    private Date checkIn;
    private Date checkOut;
    private LocalDateTime createdAt;
    private double deposit;
    private int status = 1;
}
