package com.example.primehotels.service.impl;

import com.example.primehotels.dto.FacilityListDTO;
import com.example.primehotels.entity.FacilityListEntity;
import com.example.primehotels.mapper.FacilityListMapper;
import com.example.primehotels.repository.impl.FacilityListRepo;
import com.example.primehotels.service.IFacilityListService;
import com.example.primehotels.util.ApiResponse;

import java.util.ArrayList;
import java.util.List;

public class FacilityListService implements IFacilityListService {
    FacilityListRepo facilityListRepo = new FacilityListRepo();
    FacilityListMapper mapper = new FacilityListMapper();

    @Override
    public List<FacilityListDTO> getDistinctListId() {
        List<FacilityListDTO> list = new ArrayList<>();
        List<FacilityListEntity> facilityListEntities = facilityListRepo.getDistinctListId();
        for (FacilityListEntity facilityListEntity : facilityListEntities) {
            list.add(mapper.toDTO(facilityListEntity));
        }
        return list;
    }

    @Override
    public List<FacilityListDTO> getAll() {
        return null;
    }

    @Override
    public FacilityListDTO getById(Integer id) {
        return null;
    }

    @Override
    public int save(FacilityListDTO facilityListDTO) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }
}
