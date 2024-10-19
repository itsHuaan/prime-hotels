package com.example.primehotels.repository;

import com.example.primehotels.entity.FacilityListEntity;

import java.util.List;

public interface IFacilityListRepo extends IBaseRepo<FacilityListEntity, Integer> {
    List<FacilityListEntity> getByListId(Integer facilityId);
}
