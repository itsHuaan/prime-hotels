package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.LocationEntity;
import com.example.primehotels.repository.ILocationRepo;
import com.example.primehotels.util.ApiResponse;
import com.example.primehotels.util.DatabaseConnector;
import lombok.NoArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
public class LocationRepo implements ILocationRepo {
    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;

    @Override
    public List<LocationEntity> getByType(Integer type) {
        List<LocationEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_location where type = ? order by name";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, type);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSetToEntity(resultSet));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public List<LocationEntity> getAll() {
        return null;
    }

    @Override
    public LocationEntity getById(Integer id) {
        return null;
    }

    @Override
    public int save(LocationEntity locationEntity) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public LocationEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new LocationEntity(
                resultSet.getInt(1),
                resultSet.getString(2),
                resultSet.getInt(3),
                resultSet.getString(4)
        );
    }
}
