package com.example.primehotels.service;

import com.example.primehotels.dto.HotelDTO;

import java.util.List;

public interface IHotelService extends IBaseService<HotelDTO, String> {
    List<HotelDTO> getHotelByLocation(int locationId);
}
