package com.example.primehotels.mapper;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.entity.HotelEntity;
import com.example.primehotels.model.HotelModel;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class HotelMapper {
    public HotelDTO toDTO(HotelEntity hotelEntity) {
        return HotelDTO.builder()
                .hotelId(hotelEntity.getHotelId())
                .name(hotelEntity.getName())
                .locationId(hotelEntity.getLocationId())
                .address(hotelEntity.getAddress())
                .description(hotelEntity.getDescription())
                .roomAvailable(hotelEntity.getRoomAvailable())
                .image(hotelEntity.getImage())
                .price(hotelEntity.getPrice())
                .discount(hotelEntity.getDiscount())
                .rating(hotelEntity.getRating())
                .facilityListId(hotelEntity.getFacilityListId())
                .build();
    }

    public HotelEntity toEntity(HotelModel hotelModel) {
        return HotelEntity.builder()
                .hotelId(hotelModel.getHotelId())
                .name(hotelModel.getName())
                .locationId(hotelModel.getLocationId())
                .address(hotelModel.getAddress())
                .description(hotelModel.getDescription())
                .roomAvailable(hotelModel.getRoomAvailable())
                .image(hotelModel.getImage())
                .price(hotelModel.getPrice())
                .discount(hotelModel.getDiscount())
                .rating(hotelModel.getRating())
                .status(hotelModel.isStatus())
                .facilityListId(hotelModel.getFacilityListId())
                .build();
    }

    public HotelModel toModel(HotelEntity hotelEntity) {
        return HotelModel.builder()
                .hotelId(hotelEntity.getHotelId())
                .name(hotelEntity.getName())
                .locationId(hotelEntity.getLocationId())
                .address(hotelEntity.getAddress())
                .description(hotelEntity.getDescription())
                .roomAvailable(hotelEntity.getRoomAvailable())
                .image(hotelEntity.getImage())
                .price(hotelEntity.getPrice())
                .discount(hotelEntity.getDiscount())
                .rating(hotelEntity.getRating())
                .status(hotelEntity.isStatus())
                .facilityListId(hotelEntity.getFacilityListId())
                .build();
    }
}
