<%--
  Created by IntelliJ IDEA.
  User: itsHuaan
  Date: 21-Oct-24
  Time: 23:24
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
                        <h6>Customer Management</h6>
                    </div>
                    <div class="table-responsive">
                        <table id="customerTable" class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${customers}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.index + 1}</th>
                                    <td>${item.customerId}</td>
                                    <td>${item.name}</td>
                                    <td>${item.tel}</td>
                                    <td>${item.email}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    id="dropdownMenuButton" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                Actions
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <li>
                                                    <button
                                                            type="button"
                                                            class="dropdown-item btn btn-info"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#editCustomer"
                                                            data-customerId="${item.customerId}"
                                                            data-name="${item.name}"
                                                            data-tel="${item.tel}"
                                                            data-email="${item.email}">
                                                        Edit
                                                    </button>
                                                </li>
                                                <li>
                                                    <button
                                                            type="button"
                                                            class="dropdown-item btn btn-primary"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#deleteCustomer"
                                                            data-customerId="${item.customerId}"
                                                            data-name="${item.name}">
                                                        Delete
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
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
    <div class="modal fade" id="editCustomer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-secondary">
                <form action="SaveServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Edit Customer Information</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="sourcePage" value="customerManagementPage">
                        <input type="hidden" class="form-control" id="customerId" name="customerId"
                               placeholder="Hotel ID"
                               readonly>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Customer Name">
                            <label for="name">Customer Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="tel" name="tel" pattern="\d{4}\d{3}\d{3}" placeholder="Phone Number">
                            <label for="tel">Phone Number</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="email" name="email"
                                   placeholder="Room Available" min="1">
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal End -->

    <!-- Delete Modal Start -->
    <div class="modal fade" id="deleteCustomer" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-secondary">
                <form action="DeleteServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white" id="deleteModalLabel">Delete Customer</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p id="confirmation">Are you sure you want to delete this customer?</p>
                        <p id="deleteHotelName" class="text-danger font-weight-bold"></p>
                        <input type="hidden" id="_customerId" name="_customerId" value="">
                        <input type="hidden" name="_sourcePage" value="customerManagementPage">
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
    $(document).ready(function () {
        $('#customerTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "lengthChange": true,
            "pageLength": 10
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        let deleteModal = document.getElementById('deleteCustomer');
        deleteModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            document.getElementById('confirmation').innerHTML = 'Are you sure you want to delete ' + button.getAttribute('data-name') + '?';
            document.getElementById('_customerId').value = button.getAttribute('data-customerId');
        });

        let editModal = document.getElementById('editCustomer');
        editModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let customerId = button.getAttribute('data-customerId');
            let name = button.getAttribute('data-name');
            let tel = button.getAttribute('data-tel');
            let email = button.getAttribute('data-email');
            document.getElementById('customerId').value = customerId;
            document.getElementById('name').value = name;
            document.getElementById('tel').value = tel;
            document.getElementById('email').value = email;
        });
    });
</script>

</body>
</html>

