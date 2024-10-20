package com.example.primehotels.servlet;

import com.example.primehotels.dto.ReservationDTO;
import com.example.primehotels.service.impl.ReservationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReservationManagementServlet", value = "/ReservationManagementServlet")
public class ReservationManagementServlet extends HttpServlet {
    ReservationService reservationService = new ReservationService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ReservationDTO> reservations = reservationService.getAll();
        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("reservation_management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}