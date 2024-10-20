package com.example.primehotels.servlet;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.mapper.HotelMapper;
import com.example.primehotels.service.impl.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sourcePage = request.getParameter("_sourcePage");
        if (sourcePage.equalsIgnoreCase("hotelManagementPage")) {
            HotelService hotelService = new HotelService();
            String hotelId = request.getParameter("_hotelId");
            if (hotelId == null || hotelId.isEmpty()) {
                return;
            }
            hotelService.delete(hotelId);
            response.sendRedirect("HotelManagementServlet");
        }
        if (sourcePage.equalsIgnoreCase("reservationManagementPage")) {
            System.out.println(sourcePage);
            response.sendRedirect("ReservationManagementServlet");
        }
    }
}