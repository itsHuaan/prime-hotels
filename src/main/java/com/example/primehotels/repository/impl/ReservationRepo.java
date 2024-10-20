package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.ReservationEntity;
import com.example.primehotels.repository.IReservationRepo;
import com.example.primehotels.util.ApiResponse;
import com.example.primehotels.util.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationRepo implements IReservationRepo {
    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;

    @Override
    public List<ReservationEntity> getAll() {
        List<ReservationEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_reservation where status <> 4";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                list.add(resultSetToEntity(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public ReservationEntity getById(String id) {
        ReservationEntity reservationEntity = null;
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_customer where customerId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                reservationEntity = resultSetToEntity(resultSet);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reservationEntity;
    }

    @Override
    public int save(ReservationEntity reservationEntity) {
        boolean isExisting = getById(reservationEntity.getReservationId()) != null;
        if (isExisting) {
            try {
                connection = databaseConnector.openConnection();
                String query = "update tbl_reservation set customerId = ?, hotelId = ?, checkIn = ?, checkOut = ?, reserveDate = ?, deposit = ?, status = ? where reservationId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, reservationEntity.getCustomerId());
                preparedStatement.setString(2, reservationEntity.getHotelId());
                preparedStatement.setDate(3, reservationEntity.getCheckIn());
                preparedStatement.setDate(4, reservationEntity.getCheckOut());
                preparedStatement.setTimestamp(5, reservationEntity.getCreatedAt());
                preparedStatement.setDouble(6, reservationEntity.getDeposit());
                preparedStatement.setInt(7, reservationEntity.getStatus());
                preparedStatement.setString(8, reservationEntity.getReservationId());
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
                String query = "insert into tbl_reservation value (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, reservationEntity.getReservationId());
                preparedStatement.setString(2, reservationEntity.getCustomerId());
                preparedStatement.setString(3, reservationEntity.getHotelId());
                preparedStatement.setDate(4, reservationEntity.getCheckIn());
                preparedStatement.setDate(5, reservationEntity.getCheckOut());
                preparedStatement.setTimestamp(6, reservationEntity.getCreatedAt());
                preparedStatement.setDouble(7, reservationEntity.getDeposit());
                preparedStatement.setInt(8, reservationEntity.getStatus());
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
            String query = "update tbl_reservation set status = 4 where reservationId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                return rowsAffected;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    @Override
    public ReservationEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new ReservationEntity(
                resultSet.getString(1),
                resultSet.getString(2),
                resultSet.getString(3),
                resultSet.getDate(4),
                resultSet.getDate(5),
                resultSet.getTimestamp(6),
                resultSet.getDouble(7),
                resultSet.getInt(8)
        );
    }
}
