package com.example.primehotels.mapper;

import com.example.primehotels.dto.FacilityListDTO;
import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.entity.FacilityListEntity;
import com.example.primehotels.entity.HotelEntity;
import com.example.primehotels.model.FacilityListModel;
import com.example.primehotels.model.HotelModel;

public class FacilityListMapper {
    public FacilityListDTO toDTO(FacilityListEntity facilityListEntity) {
        return FacilityListDTO.builder()
                .facilityListId(facilityListEntity.getFacilityListId())
                .name(facilityListEntity.getName())
                .facilityId(facilityListEntity.getFacilityId())
                .build();
    }

    public FacilityListEntity toEntity(FacilityListModel facilityListModel) {
        return FacilityListEntity.builder()
                .facilityListId(facilityListModel.getFacilityListId())
                .name(facilityListModel.getName())
                .facilityId(facilityListModel.getFacilityId())
                .build();
    }

    public FacilityListModel toModel(FacilityListDTO facilityListDTO) {
        return FacilityListModel.builder()
                .facilityListId(facilityListDTO.getFacilityListId())
                .name(facilityListDTO.getName())
                .facilityId(facilityListDTO.getFacilityId())
                .build();
    }
}
