<%--
  Created by IntelliJ IDEA.
  User: itsHuaan
  Date: 20-Oct-24
  Time: 11:16
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

    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <div class="col-12">
                <div class="bg-secondary rounded h-100 p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h6>Reservation Management</h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Customer ID</th>
                                <th scope="col">Hotel ID</th>
                                <th scope="col">Check In</th>
                                <th scope="col">Check Out</th>
                                <th scope="col">Deposit</th>
                                <th scope="col">Status</th>
                                <th scope="col">Created At</th>
                                <th scope="col" colspan="3">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${reservations}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.index + 1}</th>
                                    <td>${item.customerId}</td>
                                    <td>${item.hotelId}</td>
                                    <td>${item.checkIn}</td>
                                    <td>${item.checkOut}</td>
                                    <td>&#36;${item.deposit}</td>
                                    <td>
                                        <c:if test="${item.status == 1}">
                                            Reserved
                                        </c:if>
                                        <c:if test="${item.status == 2}">
                                            Checked Out
                                        </c:if>
                                        <c:if test="${item.status == 3}">
                                            Canceled
                                        </c:if>
                                    </td>
                                    <td>${item.createdAt}</td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-info"
                                                data-bs-toggle="modal"
                                                data-bs-target="#editReservation"
                                                data-reservationId="${item.reservationId}"
                                                data-customerId="${item.customerId}"
                                                data-hotelId="${item.hotelId}"
                                                data-checkIn="${item.checkIn}"
                                                data-checkOut="${item.checkOut}"
                                                data-createdAt="${item.createdAt}"
                                                data-deposit="${item.deposit}"
                                                data-status="${item.status}">
                                            Edit
                                        </button>
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-light" data-bs-toggle="modal"
                                                data-bs-target="#checkOut"
                                                data-reservationId="${item.reservationId}"
                                                data-deposit="${item.deposit}">
                                            Check Out
                                        </button>
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-primary"
                                                data-bs-toggle="modal"
                                                data-bs-target="#deleteReservation"
                                                data-reservationId="${item.reservationId}">
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal Start -->
    <div
            class="modal fade"
            id="editReservation"
            tabindex="-1"
            aria-labelledby="editReservationLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-secondary">
                <form action="SaveServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white" id="editReservationLabel">
                            Edit Reservation Information
                        </h5>
                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="sourcePage" value="reservationManagementPage">
                        <input
                                type="hidden"
                                id="reservationId"
                                name="reservationId"
                        />
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="customerId"
                                    name="customerId"
                                    placeholder="Customer ID"
                                    readonly
                            />
                            <label for="customerId">Customer ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="hotelId"
                                    name="hotelId"
                                    placeholder="Hotel ID"
                                    readonly
                            />
                            <label for="hotelId">Hotel ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="date"
                                    class="form-control datepicker"
                                    id="checkIn"
                                    name="checkIn"
                                    placeholder="Check In Date"
                            />
                            <label for="checkIn">Check In</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="date"
                                    class="form-control datepicker"
                                    id="checkOut"
                                    name="checkOut"
                                    placeholder="Check Out Date"
                            />
                            <label for="checkOut">Check Out</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    id="deposit"
                                    name="deposit"
                                    placeholder="Deposit"
                            />
                            <label for="deposit">Deposit</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" name="status" id="status">
                                <option value="1">Reserved</option>
                                <option value="2">Checked Out</option>
                                <option value="3">Canceled</option>
                            </select>
                            <label for="status">Status</label>
                        </div>
                        <input type="hidden" id="createdAt" name="createdAt"/>
                    </div>
                    <div class="modal-footer">
                        <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal End -->

    <!-- Delete Modal Start -->
    <div class="modal fade" id="deleteReservation" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-secondary">
                <form action="DeleteServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white" id="deleteModalLabel">Delete Reservation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this reservation?</p>
                        <p id="deleteReservationName" class="text-danger font-weight-bold"></p>
                        <input type="hidden" id="_hotelId" name="_hotelId" value="">
                        <input type="hidden" name="_sourcePage" value="reservationManagementPage">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger" id="confirmDelete">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Delete Modal End -->

    <jsp:include page="components/admin_footer.jsp"/>
</div>
<!-- Content End -->

<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
<jsp:include page="components/js_libraries.jsp"/>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let deleteReservationModal = document.getElementById('deleteReservation');
        deleteReservationModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            document.getElementById('_hotelId').value = button.getAttribute('data-hotelId');
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        let editReservationModal = document.getElementById('editReservation');
        editReservationModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let reservationId = button.getAttribute('data-reservationId');
            let customerId = button.getAttribute('data-customerId');
            let hotelId = button.getAttribute('data-hotelId');
            let checkIn = button.getAttribute('data-checkIn');
            let checkOut = button.getAttribute('data-checkOut');
            let deposit = button.getAttribute('data-deposit');
            let status = button.getAttribute('data-status');
            let createdAt = button.getAttribute('data-createdAt');
            document.getElementById('reservationId').value = reservationId;
            document.getElementById('customerId').value = customerId;
            document.getElementById('hotelId').value = hotelId;
            document.getElementById('checkIn').value = checkIn;
            document.getElementById('checkOut').value = checkOut;
            document.getElementById('deposit').value = deposit;
            document.getElementById('status').value = status;
            document.getElementById('createdAt').value = createdAt;
        });
    });

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

</script>
</body>
</html>
