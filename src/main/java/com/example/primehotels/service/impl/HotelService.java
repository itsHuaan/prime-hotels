package com.example.primehotels.service.impl;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.entity.HotelEntity;
import com.example.primehotels.mapper.HotelMapper;
import com.example.primehotels.repository.impl.HotelRepo;
import com.example.primehotels.service.IBaseService;
import com.example.primehotels.service.IHotelService;
import com.example.primehotels.util.ApiResponse;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
public class HotelService implements IHotelService {
    HotelRepo hotelRepo = new HotelRepo();
    HotelMapper mapper = new HotelMapper();

    @Override
    public List<HotelDTO> getAll() {
        List<HotelEntity> hotelEntities = hotelRepo.getAll();
        List<HotelDTO> hotels = new ArrayList<>();
        for (HotelEntity hotelEntity : hotelEntities) {
            hotels.add(mapper.toDTO(hotelEntity));
        }
        return hotels;
    }

    @Override
    public HotelDTO getById(String id) {
        return mapper.toDTO(hotelRepo.getById(id));
    }

    @Override
    public List<HotelDTO> getHotelByLocation(int locationId) {
        List<HotelEntity> hotelEntities = hotelRepo.getByLocation(locationId);
        List<HotelDTO> hotels = new ArrayList<>();
        for (HotelEntity hotelEntity : hotelEntities) {
            hotels.add(mapper.toDTO(hotelEntity));
        }
        return hotels;
    }

    @Override
    public int save(HotelDTO hotelDTO) {
        return hotelRepo.save(mapper.toEntity(mapper.toModel(hotelDTO)));
    }

    @Override
    public int delete(String id) {
        return hotelRepo.delete(id);
    }
}
