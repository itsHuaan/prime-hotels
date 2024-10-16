package com.example.primehotels.repository;

import com.example.primehotels.util.ApiResponse;

import java.util.List;

public interface IBaseRepository<T, U> {
    List<T> getAll();
    T getById(U id);
    U save(T t);
    ApiResponse delete(U id);
}
