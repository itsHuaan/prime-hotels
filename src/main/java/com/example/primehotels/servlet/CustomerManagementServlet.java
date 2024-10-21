package com.example.primehotels.servlet;

import com.example.primehotels.dto.CustomerDTO;
import com.example.primehotels.service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerManagementServlet", value = "/CustomerManagementServlet")
public class CustomerManagementServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerDTO> customers = customerService.getAll();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customer_management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}