package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.InvoiceEntity;
import com.example.primehotels.repository.IInvoiceRepo;
import com.example.primehotels.util.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InvoiceRepo implements IInvoiceRepo {
    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;

    @Override
    public List<InvoiceEntity> getAll() {
        List<InvoiceEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_invoice";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
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
    public InvoiceEntity getById(String id) {
        InvoiceEntity invoiceEntity = null;
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_invoice where invoiceId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                invoiceEntity = resultSetToEntity(resultSet);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return invoiceEntity;
    }

    @Override
    public int save(InvoiceEntity invoiceEntity) {
        boolean isExisting = getById(invoiceEntity.getInvoiceId()) != null;
        if (isExisting) {
            try {
                connection = databaseConnector.openConnection();
                String query = "update tbl_invoice set totalPrice = ? where invoiceId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setDouble(1, invoiceEntity.getTotalPrice());
                preparedStatement.setString(2, invoiceEntity.getInvoiceId());
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
                String query = "insert into tbl_invoice values(?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, invoiceEntity.getInvoiceId());
                preparedStatement.setString(2, invoiceEntity.getReservationId());
                preparedStatement.setTimestamp(3, invoiceEntity.getCreatedAt());
                preparedStatement.setDouble(4, invoiceEntity.getTotalPrice());
                preparedStatement.setString(5, invoiceEntity.getPaymentId());
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
            String query = "delete from tbl_invoice where invoiceId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                return rowsAffected;
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    @Override
    public InvoiceEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new InvoiceEntity(
                resultSet.getString(1),
                resultSet.getString(2),
                resultSet.getTimestamp(3),
                resultSet.getDouble(4),
                resultSet.getString(5)
        );
    }
}
