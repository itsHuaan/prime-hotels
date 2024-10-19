package com.example.primehotels.mapper;

import com.example.primehotels.dto.LocationDTO;
import com.example.primehotels.entity.LocationEntity;
import com.example.primehotels.model.LocationModel;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class LocationMapper {
    public LocationDTO toDTO(LocationEntity locationEntity) {
        return LocationDTO.builder()
                .locationId(locationEntity.getLocationId())
                .name(locationEntity.getName())
                .parentId(locationEntity.getParentId())
                .type(locationEntity.getType())
                .build();
    }

    public LocationEntity toEntity(LocationModel locationModel) {
        return LocationEntity.builder()
                .locationId(locationModel.getLocationId())
                .name(locationModel.getName())
                .parentId(locationModel.getParentId())
                .type(locationModel.getType())
                .build();
    }

    public LocationModel toModel(LocationDTO locationDTO) {
        return LocationModel.builder()
                .locationId(locationDTO.getLocationId())
                .name(locationDTO.getName())
                .parentId(locationDTO.getParentId())
                .type(locationDTO.getType())
                .build();
    }
}
