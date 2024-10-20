package com.example.primehotels.servlet;

import com.example.primehotels.mapper.HotelMapper;
import com.example.primehotels.mapper.ReservationMapper;
import com.example.primehotels.model.HotelModel;
import com.example.primehotels.model.ReservationModel;
import com.example.primehotels.service.impl.HotelService;
import com.example.primehotels.service.impl.ReservationService;
import com.example.primehotels.util.DateConverter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

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
            HotelMapper mapper = new HotelMapper();
            if (getHotelFromRequest(request, response) == null) {
                return;
            }
            hotelService.save(mapper.toDTO(mapper.toEntity(getHotelFromRequest(request, response))));
            response.sendRedirect("HotelManagementServlet");
        }
        if (sourcePage.equalsIgnoreCase("reservationManagementPage")) {
            ReservationService reservationService = new ReservationService();
            ReservationMapper mapper = new ReservationMapper();
            System.out.println(getReservationFromRequest(request, response));
            response.sendRedirect("ReservationManagementServlet");
        }

        if (sourcePage.equalsIgnoreCase("checkOut")) {
            String reservationId = request.getParameter("reservationId");
            System.out.println("Check out for " + reservationId);
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
        return new HotelModel(hotelId, hotelName, locationId, address, description, roomAvailable, null, price, discount, 5.0, 1, facilityListId);
    }

    private ReservationModel getReservationFromRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReservationModel reservation;
        String reservationId = request.getParameter("reservationId");
        if (reservationId == null || reservationId.isEmpty()) {
            reservation = null;
            return reservation;
        }
        String customerId = request.getParameter("customerId");
        String hotelId = request.getParameter("hotelId");
        String checkInStr = request.getParameter("checkIn");
        Date checkIn = DateConverter.stringToDate(checkInStr);
        String checkOutStr = request.getParameter("checkOut");
        Date checkOut = DateConverter.stringToDate(checkOutStr);
        String createdAtStr = request.getParameter("createdAt");
        LocalDateTime createdAt = LocalDateTime.parse(createdAtStr);
        double depositAmount = Double.parseDouble(request.getParameter("deposit"));
        int status = Integer.parseInt(request.getParameter("status"));
        return new ReservationModel(reservationId, customerId, hotelId, checkIn, checkOut, createdAt, depositAmount, status);
    }
}