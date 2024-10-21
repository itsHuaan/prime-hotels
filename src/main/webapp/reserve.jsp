<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21-Oct-24
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Hotel management</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="components/css_libraries.jsp"/>
</head>
<body>
<!-- Sidebar Start -->
<jsp:include page="components/sidebar.jsp"/>
<!-- Sidebar End -->

<!-- Content Start -->
<div class="content">
    <!-- Navbar Start -->
    <jsp:include page="components/navbar.jsp"/>
    <!-- Navbar End -->
    <!-- Form Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <div class="col-12">
                <div class="card bg-secondary rounded h-100 p-4">
                    <h6 class="mb-4">Hotel Reservation Form</h6>
                    <form action="ReserveServlet" method="post">
                        <input type="hidden" name="sourcePage" value="adminSide">

                        <!-- Customer ID -->
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="customerId" name="customerId"
                                   placeholder="Customer ID">
                            <label for="customerId">Customer ID</label>
                        </div>

                        <!-- Customer Name -->
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="customerName" name="customerName"
                                   placeholder="Customer Name">
                            <label for="customerName">Customer Name</label>
                        </div>

                        <!-- Customer Telephone -->
                        <div class="form-floating mb-3">
                            <input type="tel" class="form-control" id="customerTel" name="customerTel"
                                   placeholder="Customer Telephone">
                            <label for="customerTel">Customer Telephone</label>
                        </div>

                        <!-- Customer Email -->
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="customerEmail" name="customerEmail"
                                   placeholder="Customer Email">
                            <label for="customerEmail">Customer Email</label>
                        </div>

                        <!-- Hotel Selection -->
                        <div class="form-floating mb-3">
                            <select class="form-select" id="hotelSelect" name="hodelId" aria-label="Select Hotel">
                                <option selected>Select a hotel</option>
                                <c:forEach var="hotel" items="${hotels}">
                                    <option value="${hotel.hotelId}"
                                            data-price="${hotel.price}"
                                            data-discount="${hotel.discount}">
                                            ${hotel.name} - ${hotel.address}
                                    </option>
                                </c:forEach>
                            </select>
                            <label for="hotelSelect">Hotel</label>
                        </div>

                        <!-- Check-in and Check-out Dates in a Single Row -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="date" class="form-control datepicker" id="checkIn" name="checkIn"
                                           placeholder="Check-in Date">
                                    <label for="checkIn">Check-in Date</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="date" class="form-control datepicker" id="checkOut" name="checkOut"
                                           placeholder="Check-out Date">
                                    <label for="checkOut">Check-out Date</label>
                                </div>
                            </div>
                        </div>

                        <!-- Deposit -->
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="deposit" name="deposit"
                                   placeholder="Deposit Amount" min="0">
                            <label for="deposit">Deposit Amount ($)</label>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100 mt-4">Submit Reservation</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Form End -->

    <jsp:include page="components/admin_footer.jsp"/>
</div>
<!-- Content End -->

<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
<jsp:include page="components/js_libraries.jsp"/>
<script>
    $(document).ready(function () {
        let checkInDate = $('#checkIn');
        let checkOutDate = $('#checkOut');
        checkInDate.datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true
        }).on('changeDate', function (selected) {
            let minDate = new Date(selected.date.valueOf());
            minDate.setDate(minDate.getDate() + 1);
            checkOutDate.datepicker('setDate', minDate);
            checkOutDate.datepicker('setStartDate', minDate);
        });
        checkOutDate.datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true
        });
    });

    document.addEventListener("DOMContentLoaded", function() {
        const hotelSelect = document.getElementById("hotelSelect");
        const depositInput = document.getElementById("deposit");
        const checkInInput = document.getElementById("checkIn");
        const checkOutInput = document.getElementById("checkOut");
        function calculateDaysDifference(checkIn, checkOut) {
            const checkInDate = new Date(checkIn);
            const checkOutDate = new Date(checkOut);
            const timeDiff = checkOutDate - checkInDate;
            return Math.ceil(timeDiff / (1000 * 3600 * 24));
        }
        function calculateDeposit() {
            const selectedOption = hotelSelect.options[hotelSelect.selectedIndex];
            const price = selectedOption.getAttribute("data-price");
            const discount = selectedOption.getAttribute("data-discount");
            const discountedPrice = price - (price * discount);
            const checkIn = checkInInput.value;
            const checkOut = checkOutInput.value;
            if (discountedPrice && checkIn && checkOut) {
                const days = calculateDaysDifference(checkIn, checkOut);
                if (days > 0) {
                    const totalPrice = discountedPrice * days;
                    const deposit = totalPrice * 0.30;
                    depositInput.value = deposit.toFixed(2);
                } else {
                    depositInput.value = "";
                }
            } else {
                depositInput.value = "";
            }
        }
        hotelSelect.addEventListener("change", calculateDeposit);
        checkInInput.addEventListener("change", calculateDeposit);
        checkOutInput.addEventListener("change", calculateDeposit);
    });
</script>
</body>
</html>

