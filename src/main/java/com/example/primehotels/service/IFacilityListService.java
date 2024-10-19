package com.example.primehotels.service;

import com.example.primehotels.dto.FacilityListDTO;

import java.util.List;

public interface IFacilityListService extends IBaseService<FacilityListDTO, Integer> {
    List<FacilityListDTO> getDistinctListId();
}
