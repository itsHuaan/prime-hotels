package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.HotelEntity;
import com.example.primehotels.repository.IHotelRepo;
import com.example.primehotels.util.ApiResponse;
import com.example.primehotels.util.DatabaseConnector;
import lombok.NoArgsConstructor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
public class HotelRepo implements IHotelRepo {
    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;

    @Override
    public List<HotelEntity> getAll() {
        List<HotelEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String sql = "select * from tbl_hotel where status = 1";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
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
    public HotelEntity getById(String id) {
        HotelEntity hotelEntity = new HotelEntity();
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_hotel where hotelId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                hotelEntity = resultSetToEntity(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hotelEntity;
    }

    @Override
    public List<HotelEntity> getByLocation(int locationId) {
        List<HotelEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String sql = "select * from tbl_hotel where locationId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, locationId);
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
    public List<String> getFacilities(String hotelId) {
        List<String> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String query = "SELECT f.name " +
                    "FROM tbl_hotel h " +
                    "JOIN tbl_facilityList fl ON h.facilityListId = fl.facilityListId " +
                    "JOIN tbl_facility f ON fl.facilityId = f.facilityId " +
                    "WHERE h.hotelId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, hotelId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSet.getString("name"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public HotelEntity updateRoomAvailable(String hotelId) {
        return null;
    }

    @Override
    public int save(HotelEntity hotelEntity) {
        return 0;
    }

    @Override
    public ApiResponse delete(String id) {
        return null;
    }

    @Override
    public HotelEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new HotelEntity(
                resultSet.getString(1),
                resultSet.getString(2),
                resultSet.getInt(3),
                resultSet.getString(4),
                resultSet.getString(5),
                resultSet.getInt(6),
                resultSet.getString(7),
                resultSet.getDouble(8),
                resultSet.getInt(9),
                resultSet.getDouble(10),
                resultSet.getBoolean(11),
                resultSet.getInt(12)
        );
    }
}
