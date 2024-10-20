package com.example.primehotels.repository;

import com.example.primehotels.entity.HotelEntity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface IHotelRepo extends IBaseRepo<HotelEntity, String>{
    List<HotelEntity> getByLocation(int locationId);
    List<String> getFacilities(String hotelId);
    HotelEntity updateRoomAvailable(String hotelId);
    List<HotelEntity> sortByRating();
}
