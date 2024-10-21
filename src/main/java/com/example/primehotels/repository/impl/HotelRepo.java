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
        HotelEntity hotelEntity = null;
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_hotel where hotelId = ? and status = 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                hotelEntity = resultSetToEntity(resultSet);
            }
            connection.close();
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
            String sql = "select * from tbl_hotel where locationId = ? and status = 1";
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
            connection.close();
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
    public List<HotelEntity> sortByRating() {
        List<HotelEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String sql = "select * from tbl_hotel where status = 1 order by rating desc";
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
    public int save(HotelEntity hotelEntity) {
        boolean isExisting = getById(hotelEntity.getHotelId()) != null;
        if (isExisting){
            try {
                connection = databaseConnector.openConnection();
                String query = "update tbl_hotel set name = ?, locationId = ?, address = ?, description = ?, roomAvailable = ?, image = ?, price = ?, discount = ?, rating = ?, status = ?, facilityListId = ? where hotelId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, hotelEntity.getName());
                preparedStatement.setInt(2, hotelEntity.getLocationId());
                preparedStatement.setString(3, hotelEntity.getAddress());
                preparedStatement.setString(4, hotelEntity.getDescription());
                preparedStatement.setInt(5, hotelEntity.getRoomAvailable());
                preparedStatement.setString(6, hotelEntity.getImage());
                preparedStatement.setDouble(7, hotelEntity.getPrice());
                preparedStatement.setInt(8, hotelEntity.getDiscount());
                preparedStatement.setDouble(9, hotelEntity.getRating());
                preparedStatement.setInt(10, hotelEntity.getStatus());
                preparedStatement.setInt(11, hotelEntity.getFacilityListId());
                preparedStatement.setString(12, hotelEntity.getHotelId());
                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    return rowsAffected;
                }
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                connection = databaseConnector.openConnection();
                String query = "insert into tbl_hotel values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, hotelEntity.getHotelId());
                preparedStatement.setString(2, hotelEntity.getName());
                preparedStatement.setInt(3, hotelEntity.getLocationId());
                preparedStatement.setString(4, hotelEntity.getAddress());
                preparedStatement.setString(5, hotelEntity.getDescription());
                preparedStatement.setInt(6, hotelEntity.getRoomAvailable());
                preparedStatement.setString(7, hotelEntity.getImage());
                preparedStatement.setDouble(8, hotelEntity.getPrice());
                preparedStatement.setInt(9, hotelEntity.getDiscount());
                preparedStatement.setDouble(10, hotelEntity.getRating());
                preparedStatement.setInt(11, hotelEntity.getStatus());
                preparedStatement.setInt(12, hotelEntity.getFacilityListId());
                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    return rowsAffected;
                }
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

    @Override
    public int delete(String id) {
        try {
            connection = databaseConnector.openConnection();
            String query = "update tbl_hotel set status = 0 where hotelId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            int rowAffected = preparedStatement.executeUpdate();
            if (rowAffected > 0) {
                return rowAffected;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
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
                resultSet.getInt(11),
                resultSet.getInt(12)
        );
    }
}
