package com.example.primehotels.service;

import com.example.primehotels.dto.LocationDTO;

import java.util.List;

public interface ILocationService extends IBaseService<LocationDTO, Integer> {
    List<LocationDTO> getByType(Integer type);
}
