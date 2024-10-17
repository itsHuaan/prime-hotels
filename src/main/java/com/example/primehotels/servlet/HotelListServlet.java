package com.example.primehotels.servlet;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.service.impl.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HotelListServlet", value = "/HotelListServlet")
public class HotelListServlet extends HttpServlet {
    HotelService hotelService = new HotelService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HotelDTO> hotels = hotelService.getHotelByLocation(Integer.parseInt(request.getParameter("locationId")));
        request.setAttribute("hotels", hotels);
        request.getRequestDispatcher("hotel_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}