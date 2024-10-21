package com.example.primehotels.service.impl;

import com.example.primehotels.dto.CustomerDTO;
import com.example.primehotels.entity.CustomerEntity;
import com.example.primehotels.mapper.CustomerMapper;
import com.example.primehotels.repository.impl.CustomerRepo;
import com.example.primehotels.service.ICustomerService;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {
    CustomerRepo customerRepo = new CustomerRepo();
    CustomerMapper mapper = new CustomerMapper();

    @Override
    public List<CustomerDTO> getAll() {
        List<CustomerDTO> customers = new ArrayList<>();
        List<CustomerEntity> customerEntities = customerRepo.getAll();
        for (CustomerEntity customerEntity : customerEntities) {
            customers.add(mapper.toDTO(customerEntity));
        }
        return customers;
    }

    @Override
    public CustomerDTO getById(String id) {
        return mapper.toDTO(customerRepo.getById(id));
    }

    @Override
    public int save(CustomerDTO customerDTO) {
        return customerRepo.save(mapper.toEntity(mapper.toModel(customerDTO)));
    }

    @Override
    public int delete(String id) {
        return customerRepo.delete(id);
    }
}
