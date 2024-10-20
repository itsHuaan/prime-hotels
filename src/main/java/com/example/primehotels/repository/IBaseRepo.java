package com.example.primehotels.repository;

import com.example.primehotels.entity.HotelEntity;
import com.example.primehotels.util.ApiResponse;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface IBaseRepo<T, U> {
    List<T> getAll();
    T getById(U id);
    int save(T t);
    int delete(U id);
    T resultSetToEntity(ResultSet resultSet) throws SQLException;
}
