package com.example.primehotels.servlet;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.repository.impl.HotelRepo;
import com.example.primehotels.service.impl.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HotelListServlet", value = "/HotelListServlet")
public class HotelListServlet extends HttpServlet {
    HotelService hotelService = new HotelService();
    HotelRepo hotelRepo = new HotelRepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locationId = Integer.parseInt(request.getParameter("locationId"));
        List<HotelDTO> hotels = hotelService.getHotelByLocation(locationId);
        List<List<String>> facilitiesList = new ArrayList<>();
        for (HotelDTO hotel : hotels) {
            List<String> facilities = hotelRepo.getFacilities(hotel.getHotelId());
            facilitiesList.add(facilities);
        }
        request.setAttribute("hotels", hotels);
        request.setAttribute("facilitiesList", facilitiesList);
        request.getRequestDispatcher("hotel_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}