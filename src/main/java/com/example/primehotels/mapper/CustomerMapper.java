package com.example.primehotels.mapper;

import com.example.primehotels.dto.CustomerDTO;
import com.example.primehotels.entity.CustomerEntity;
import com.example.primehotels.model.CustomerModel;

public class CustomerMapper {
    public CustomerDTO toDTO(CustomerEntity customerEntity) {
        return CustomerDTO.builder()
                .customerId(customerEntity.getCustomerId())
                .name(customerEntity.getName())
                .tel(customerEntity.getTel())
                .email(customerEntity.getEmail())
                .build();
    }
    public CustomerEntity toEntity(CustomerModel customerModel) {
        return CustomerEntity.builder()
                .customerId(customerModel.getCustomerId())
                .name(customerModel.getName())
                .tel(customerModel.getTel())
                .email(customerModel.getEmail()).build();
    }
    public CustomerModel toModel(CustomerDTO customerDTO) {
        return CustomerModel.builder()
                .customerId(customerDTO.getCustomerId())
                .name(customerDTO.getName())
                .tel(customerDTO.getTel())
                .email(customerDTO.getEmail()).build();
    }
}
