package com.example.primehotels.service.impl;

import com.example.primehotels.dto.LocationDTO;
import com.example.primehotels.entity.LocationEntity;
import com.example.primehotels.mapper.LocationMapper;
import com.example.primehotels.repository.impl.LocationRepo;
import com.example.primehotels.service.IBaseService;
import com.example.primehotels.service.ILocationService;
import com.example.primehotels.util.ApiResponse;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
public class LocationService implements ILocationService {
    LocationRepo locationRepo = new LocationRepo();
    LocationMapper mapper = new LocationMapper();

    @Override
    public List<LocationDTO> getByType(Integer type) {
        List<LocationDTO> locations = new ArrayList<>();
        List<LocationEntity> locationEntities = locationRepo.getByType(type);
        for (LocationEntity locationEntity : locationEntities) {
            locations.add(mapper.toDTO(locationEntity));
        }
        return locations;
    }

    @Override
    public List<LocationDTO> getAll() {
        return null;
    }

    @Override
    public LocationDTO getById(Integer id) {
        return null;
    }

    @Override
    public Integer save(LocationDTO locationDTO) {
        return 0;
    }

    @Override
    public ApiResponse delete(Integer id) {
        return null;
    }
}
