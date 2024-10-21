package com.example.primehotels.service.impl;

import com.example.primehotels.dto.ReservationDTO;
import com.example.primehotels.entity.ReservationEntity;
import com.example.primehotels.mapper.ReservationMapper;
import com.example.primehotels.repository.impl.ReservationRepo;
import com.example.primehotels.service.IReservationService;

import java.util.ArrayList;
import java.util.List;

public class ReservationService implements IReservationService {
    ReservationRepo reservationRepo = new ReservationRepo();
    ReservationMapper mapper = new ReservationMapper();

    @Override
    public List<ReservationDTO> getAll() {
        List<ReservationDTO> reservations = new ArrayList<>();
        List<ReservationEntity> reservationEntities = reservationRepo.getAll();
        for (ReservationEntity reservationEntity : reservationEntities) {
            reservations.add(mapper.toDTO(reservationEntity));
        }
        return reservations;
    }

    @Override
    public ReservationDTO getById(String id) {
        return mapper.toDTO(reservationRepo.getById(id));
    }

    @Override
    public int save(ReservationDTO reservationDTO) {
        return reservationRepo.save(mapper.toEntity(mapper.toModel(reservationDTO)));
    }

    @Override
    public int delete(String id) {
        return 0;
    }
}
