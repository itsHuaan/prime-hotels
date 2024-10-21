package com.example.primehotels.repository.impl;

import com.example.primehotels.entity.CustomerEntity;
import com.example.primehotels.repository.ICustomerRepo;
import com.example.primehotels.util.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    DatabaseConnector databaseConnector = new DatabaseConnector();
    Connection connection = null;

    @Override
    public List<CustomerEntity> getAll() {
        List<CustomerEntity> list = new ArrayList<>();
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_customer";
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
    public CustomerEntity getById(String id) {
        CustomerEntity customerEntity = null;
        try {
            connection = databaseConnector.openConnection();
            String query = "select * from tbl_customer where customerId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                customerEntity = resultSetToEntity(resultSet);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerEntity;
    }

    @Override
    public int save(CustomerEntity customerEntity) {
        boolean isExisting = getById(customerEntity.getCustomerId()) != null;
        if (isExisting) {
            try {
                connection = databaseConnector.openConnection();
                String query = "update tbl_customer set name = ?, tel = ?, email = ? where customerId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, customerEntity.getName());
                preparedStatement.setString(2, customerEntity.getTel());
                preparedStatement.setString(3, customerEntity.getEmail());
                preparedStatement.setString(4, customerEntity.getCustomerId());
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
                String query = "insert into tbl_customer values (?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, customerEntity.getCustomerId());
                preparedStatement.setString(2, customerEntity.getName());
                preparedStatement.setString(3, customerEntity.getTel());
                preparedStatement.setString(4, customerEntity.getEmail());
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
            String query = "delete from tbl_customer where customerId = ?";
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
    public CustomerEntity resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new CustomerEntity(
                resultSet.getString(1),
                resultSet.getString(2),
                resultSet.getString(3),
                resultSet.getString(4)
        );
    }
}
