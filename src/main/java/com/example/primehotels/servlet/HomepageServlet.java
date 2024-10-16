package com.example.primehotels.servlet;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.dto.LocationDTO;
import com.example.primehotels.service.impl.HotelService;
import com.example.primehotels.service.impl.LocationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomepageServlet", value = "/HomepageServlet")
public class HomepageServlet extends HttpServlet {
    LocationService locationService = new LocationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LocationDTO> locations = locationService.getByType(1);

        request.setAttribute("locations", locations);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}