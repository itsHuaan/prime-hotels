package com.example.primehotels.servlet;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.repository.impl.HotelRepo;
import com.example.primehotels.service.impl.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookingServlet", value = "/BookingServlet")
public class BookingServlet extends HttpServlet {
    HotelService hotelService = new HotelService();
    HotelRepo hotelRepo = new HotelRepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("hotelId");
        HotelDTO hotel = hotelService.getById(id);
        List<String> facilities = hotelRepo.getFacilities(id);
        System.out.println(hotel);
        request.setAttribute("hotel", hotel);
        request.setAttribute("facilities", facilities);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}