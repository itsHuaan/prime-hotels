package com.example.primehotels.mapper;

import com.example.primehotels.dto.FacilityListDTO;
import com.example.primehotels.dto.InvoiceDTO;
import com.example.primehotels.entity.FacilityListEntity;
import com.example.primehotels.entity.InvoiceEntity;
import com.example.primehotels.model.FacilityListModel;
import com.example.primehotels.model.InvoiceModel;

import java.sql.Timestamp;

public class InvoiceMapper {
    public InvoiceDTO toDTO(InvoiceEntity invoiceEntity) {
        return InvoiceDTO.builder()
                .invoiceId(invoiceEntity.getInvoiceId())
                .reservationId(invoiceEntity.getReservationId())
                .createdAt(invoiceEntity.getCreatedAt().toLocalDateTime())
                .totalPrice(invoiceEntity.getTotalPrice())
                .paymentId(invoiceEntity.getPaymentId())
                .build();
    }

    public InvoiceEntity toEntity(InvoiceModel invoiceModel) {
        return InvoiceEntity.builder()
                .invoiceId(invoiceModel.getInvoiceId())
                .reservationId(invoiceModel.getReservationId())
                .createdAt(Timestamp.valueOf(invoiceModel.getCreatedAt()))
                .totalPrice(invoiceModel.getTotalPrice())
                .paymentId(invoiceModel.getPaymentId())
                .build();
    }

    public InvoiceModel toModel(InvoiceDTO invoiceDTO) {
        return InvoiceModel.builder()
                .invoiceId(invoiceDTO.getInvoiceId())
                .reservationId(invoiceDTO.getReservationId())
                .createdAt(invoiceDTO.getCreatedAt())
                .totalPrice(invoiceDTO.getTotalPrice())
                .paymentId(invoiceDTO.getPaymentId())
                .build();
    }
}
