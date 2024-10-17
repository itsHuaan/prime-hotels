package com.example.primehotels.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReserveServlet", value = "/ReserveServlet")
public class ReserveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        System.out.println(checkin + "\n" + checkout);
    }
}