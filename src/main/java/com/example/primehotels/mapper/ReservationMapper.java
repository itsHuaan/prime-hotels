package com.example.primehotels.mapper;

import com.example.primehotels.dto.ReservationDTO;
import com.example.primehotels.entity.ReservationEntity;
import com.example.primehotels.model.ReservationModel;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
public class ReservationMapper {
    public ReservationDTO toDTO(ReservationEntity reservationEntity) {
        return ReservationDTO.builder()
                .reservationId(reservationEntity.getReservationId())
                .customerId(reservationEntity.getCustomerId())
                .hotelId(reservationEntity.getHotelId())
                .checkIn(reservationEntity.getCheckIn())
                .checkOut(reservationEntity.getCheckOut())
                .createdAt(reservationEntity.getCreatedAt().toLocalDateTime())
                .deposit(reservationEntity.getDeposit())
                .status(reservationEntity.getStatus())
                .build();
    }
    public ReservationEntity toEntity(ReservationModel reservationModel) {
        return ReservationEntity.builder()
                .reservationId(reservationModel.getReservationId())
                .customerId(reservationModel.getCustomerId())
                .hotelId(reservationModel.getHotelId())
                .checkIn(new java.sql.Date(reservationModel.getCheckIn().getTime()))
                .checkOut(new java.sql.Date(reservationModel.getCheckOut().getTime()))
                .createdAt(Timestamp.valueOf(reservationModel.getCreatedAt()))
                .deposit(reservationModel.getDeposit())
                .status(reservationModel.getStatus())
                .build();
    }
    public ReservationModel toModel(ReservationDTO reservationDTO) {
        return ReservationModel.builder()
                .reservationId(reservationDTO.getReservationId())
                .customerId(reservationDTO.getCustomerId())
                .hotelId(reservationDTO.getHotelId())
                .checkIn(reservationDTO.getCheckIn())
                .checkOut(reservationDTO.getCheckOut())
                .createdAt(reservationDTO.getCreatedAt())
                .deposit(reservationDTO.getDeposit())
                .status(reservationDTO.getStatus())
                .build();
    }
}
