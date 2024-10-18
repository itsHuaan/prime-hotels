package com.example.primehotels.servlet;

import com.example.primehotels.dto.HotelDTO;
import com.example.primehotels.dto.ReservationDTO;
import com.example.primehotels.entity.ReservationEntity;
import com.example.primehotels.mapper.ReservationMapper;
import com.example.primehotels.model.ReservationModel;
import com.example.primehotels.repository.impl.ReservationRepo;
import com.example.primehotels.service.impl.HotelService;
import com.example.primehotels.util.DateConverter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "ReserveServlet", value = "/ReserveServlet")
public class ReserveServlet extends HttpServlet {
    ReservationMapper mapper = new ReservationMapper();
    ReservationRepo reservationRepo = new ReservationRepo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hotelId = request.getParameter("hotelId");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        ReservationModel reservationModel = new ReservationModel(
                UUID.randomUUID().toString(),
                "001201007756",
                hotelId,
                DateConverter.stringToDate(checkin),
                DateConverter.stringToDate(checkout),
                new Date(),
                deposit,
                1
        );
        HotelService hotelService = new HotelService();
        HotelDTO hotelDTO = hotelService.getById(reservationModel.getHotelId());
        reservationRepo.save(mapper.toEntity(reservationModel));
        request.setAttribute("hotel", hotelDTO);
        request.setAttribute("reservation", mapper.toDTO(mapper.toEntity(reservationModel)));
        request.getRequestDispatcher("/booking_success.jsp").forward(request, response);
    }
}