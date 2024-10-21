<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18-Oct-24
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-secondary navbar-dark">
        <a href="HomepageServlet" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>PrimeHotels</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">itsHuaan</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="AdminReserve" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Make A Reservation</a>
            <a href="HotelManagementServlet" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Hotels</a>
            <a href="ReservationManagementServlet" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Reservations</a>
            <a href="CustomerManagementServlet" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Customers</a>
        </div>
    </nav>
</div>
