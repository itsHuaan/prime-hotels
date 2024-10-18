package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.ReservationEntity;
import com.example.primehotels.repository.IReservationRepo;
import com.example.primehotels.util.ApiResponse;
import com.example.primehotels.util.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ReservationRepo implements IReservationRepo {
    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;
    @Override
    public List<ReservationEntity> getAll() {
        return null;
    }

    @Override
    public ReservationEntity getById(String id) {
        return null;
    }

    @Override
    public int save(ReservationEntity reservationEntity) {
        try {
            connection = databaseConnector.openConnection();
            String query = "insert into tbl_reservation value (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, reservationEntity.getReservationId());
            preparedStatement.setString(2, reservationEntity.getCustomerId());
            preparedStatement.setString(3, reservationEntity.getHotelId());
            preparedStatement.setDate(4, reservationEntity.getCheckIn());
            preparedStatement.setDate(5, reservationEntity.getCheckOut());
            preparedStatement.setDate(6, reservationEntity.getReserveDate());
            preparedStatement.setDouble(7, reservationEntity.getDeposit());
            preparedStatement.setInt(8, reservationEntity.getStatus());
            if (preparedStatement.executeUpdate() > 0) {
                return 1;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    @Override
    public ApiResponse delete(String id) {
        return null;
    }

    @Override
    public ReservationEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return null;
    }
}
