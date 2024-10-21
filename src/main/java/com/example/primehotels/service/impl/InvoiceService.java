package com.example.primehotels.service.impl;

import com.example.primehotels.dto.InvoiceDTO;
import com.example.primehotels.entity.InvoiceEntity;
import com.example.primehotels.mapper.InvoiceMapper;
import com.example.primehotels.repository.impl.InvoiceRepo;
import com.example.primehotels.service.IInvoiceService;

import java.util.ArrayList;
import java.util.List;

public class InvoiceService implements IInvoiceService {
    InvoiceRepo invoiceRepo = new InvoiceRepo();
    InvoiceMapper mapper = new InvoiceMapper();

    @Override
    public List<InvoiceDTO> getAll() {
        List<InvoiceEntity> invoiceEntities = invoiceRepo.getAll();
        List<InvoiceDTO> invoices = new ArrayList<>();
        for (InvoiceEntity invoiceEntity : invoiceEntities) {
            invoices.add(mapper.toDTO(invoiceEntity));
        }
        return invoices;
    }

    @Override
    public InvoiceDTO getById(String id) {
        return mapper.toDTO(invoiceRepo.getById(id));
    }

    @Override
    public int save(InvoiceDTO invoiceDTO) {
        return invoiceRepo.save(mapper.toEntity(mapper.toModel(invoiceDTO)));
    }

    @Override
    public int delete(String id) {
        return invoiceRepo.delete(id);
    }
}
