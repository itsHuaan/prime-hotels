package com.example.primehotels.service;

import com.example.primehotels.util.ApiResponse;

import java.util.List;

public interface IBaseService<T, U> {
    List<T> getAll();
    T getById(U id);
    int save(T t);
    ApiResponse delete(U id);
}
