package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.FacilityListEntity;
import com.example.primehotels.repository.IFacilityListRepo;
import com.example.primehotels.util.ApiResponse;
import com.example.primehotels.util.DatabaseConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacilityListRepo implements IFacilityListRepo {

    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;

    @Override
    public List<FacilityListEntity> getAll() {
        List<FacilityListEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
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
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public FacilityListEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new FacilityListEntity(
                resultSet.getInt(1),
                resultSet.getString(2),
                resultSet.getInt(3)
        );
    }

    @Override
    public List<FacilityListEntity> getDistinctListId() {
        List<FacilityListEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_facilitylist group by facilityListId";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                list.add(resultSetToEntity(resultSet));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
