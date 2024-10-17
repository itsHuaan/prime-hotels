package com.example.primehotels.repository;

import com.example.primehotels.entity.LocationEntity;

import java.util.List;

public interface ILocationRepo extends IBaseRepo<LocationEntity, Integer> {
    List<LocationEntity> getByType(Integer type);
}
