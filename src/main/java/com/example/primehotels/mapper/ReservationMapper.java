package com.example.primehotels.mapper;

import com.example.primehotels.dto.ReservationDTO;
import com.example.primehotels.entity.ReservationEntity;
import com.example.primehotels.model.ReservationModel;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class ReservationMapper {
    public ReservationDTO toDTO(ReservationEntity reservationEntity) {
        return ReservationDTO.builder()
                .reservationId(reservationEntity.getReservationId())
                .customerId(reservationEntity.getCustomerId())
                .hotelId(reservationEntity.getHotelId())
                .checkIn(reservationEntity.getCheckIn())
                .checkOut(reservationEntity.getCheckOut())
                .reserveDate(reservationEntity.getReserveDate())
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
                .reserveDate(new java.sql.Date(reservationModel.getReserveDate().getTime()))
                .deposit(reservationModel.getDeposit())
                .status(reservationModel.getStatus())
                .build();
    }
    public ReservationModel toModel(ReservationEntity reservationEntity) {
        return ReservationModel.builder()
                .reservationId(reservationEntity.getReservationId())
                .customerId(reservationEntity.getCustomerId())
                .hotelId(reservationEntity.getHotelId())
                .checkIn(reservationEntity.getCheckIn())
                .checkOut(reservationEntity.getCheckOut())
                .reserveDate(reservationEntity.getReserveDate())
                .deposit(reservationEntity.getDeposit())
                .status(reservationEntity.getStatus())
                .build();
    }
}
