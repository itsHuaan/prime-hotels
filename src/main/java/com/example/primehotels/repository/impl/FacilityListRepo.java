package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.FacilityListEntity;
import com.example.primehotels.repository.IFacilityListRepo;
import com.example.primehotels.util.ApiResponse;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityListRepo implements IFacilityListRepo {
    @Override
    public List<FacilityListEntity> getAll() {
        return new ArrayList<FacilityListEntity>();
    }

    @Override
    public FacilityListEntity getById(Integer id) {
        return null;
    }

    @Override
    public int save(FacilityListEntity facilityListEntity) {
        return 0;
    }

    @Override
    public ApiResponse delete(Integer id) {
        return null;
    }

    @Override
    public FacilityListEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List<FacilityListEntity> getByListId(Integer facilityId) {
        return List.of();
    }
}
