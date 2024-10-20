package com.example.primehotels.servlet;
import com.example.primehotels.mapper.HotelMapper;
import com.example.primehotels.model.HotelModel;
import com.example.primehotels.service.impl.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SaveServlet", value = "/SaveServlet")
public class SaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sourcePage = request.getParameter("sourcePage");
        if (sourcePage == null) {
            return;
        }
        if (sourcePage.equalsIgnoreCase("hotelManagementPage")) {
            HotelService hotelService = new HotelService();
            HotelMapper hotelMapper = new HotelMapper();
            if (getHotelFromRequest(request, response) == null) {
                return;
            }
            hotelService.save(hotelMapper.toDTO(hotelMapper.toEntity(getHotelFromRequest(request, response))));
            response.sendRedirect("HotelManagementServlet");
        }
        if (sourcePage.equalsIgnoreCase("reservationManagementPage")) {

            response.sendRedirect("ReservationManagementServlet");
        }
    }

    private HotelModel getHotelFromRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HotelModel hotel;
        String hotelId = request.getParameter("hotelId");
        if (hotelId == null || hotelId.isEmpty()) {
            hotel = null;
            return hotel;
        }
        String hotelName = request.getParameter("name");
        int locationId = Integer.parseInt(request.getParameter("locationId"));
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        int roomAvailable = Integer.parseInt(request.getParameter("roomAvailable"));
        double price = Double.parseDouble(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int facilityListId = Integer.parseInt(request.getParameter("facilityListId"));
        hotel = new HotelModel(hotelId, hotelName, locationId, address, description, roomAvailable, null, price, discount, 5.0, 1, facilityListId);
        return hotel;
    }
}