package com.example.primehotels.servlet;
import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.service.impl.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HotelManagementServlet", value = "/HotelManagementServlet")
public class HotelManagementServlet extends HttpServlet {
    HotelService hotelService = new HotelService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HotelDTO> hotels = hotelService.getAll();
        request.setAttribute("hotels", hotels);
        request.getRequestDispatcher("hotel_management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}