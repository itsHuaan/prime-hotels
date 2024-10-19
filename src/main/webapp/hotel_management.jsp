<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18-Oct-24
  Time: 14:19
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
<div class="content">
    <!-- Navbar Start -->
    <jsp:include page="components/navbar.jsp"/>
    <!-- Navbar End -->
    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <div class="col-12">
                <div class="bg-secondary rounded h-100 p-4">
                    <h6 class="mb-4">Responsive Table</h6>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Description</th>
                                <th scope="col">Room Available</th>
                                <th scope="col">Price</th>
                                <th scope="col">Status</th>
                                <th scope="col" colspan="2">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${hotels}">
                                <tr>
                                    <th scope="row">${item.hotelId}</th>
                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.description}</td>
                                    <td>${item.roomAvailable}</td>
                                    <td>${item.price}</td>
                                    <td>${item.status}</td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-info"
                                                data-bs-toggle="modal"
                                                data-bs-target="#editHotel"
                                                data-hotelId="${item.hotelId}"
                                                data-name="${item.name}"
                                                data-locationId="${item.locationId}"
                                                data-address="${item.address}"
                                                data-description="${item.description}"
                                                data-roomAvailable="${item.roomAvailable}"
                                                data-image="${item.image}"
                                                data-price="${item.price}"
                                                data-discount="${item.discount}"
                                                data-status="${item.status}"
                                                data-facilityListId="${item.facilityListId}"
                                        >
                                            Edit
                                        </button>
                                    </td>
                                    <td>
                                        <button
                                                type="button"
                                                class="btn btn-primary"
                                                data-bs-toggle="modal"
                                                data-bs-target="#exampleModal"
                                                data-whatever="@mdo">
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
    <div class="modal fade" id="editHotel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-secondary">
                <div class="modal-header">
                    <h5 class="modal-title text-white" id="exampleModalLabel">Edit Hotel Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="#" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="hotelId" placeholder="Hotel ID">
                            <label for="hotelId">Hotel ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="name" placeholder="Hotel Name">
                            <label for="name">Hotel Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="locationId">
                                <c:forEach var="item" items="${locations}">
                                    <option value="${item.locationId}">${item.name}</option>
                                </c:forEach>
                            </select>
                            <label for="locationId">Location</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="address" placeholder="Address">
                            <label for="address">Address</label>
                        </div>
                        <div class="form-floating mb-3">
                                <textarea class="form-control" id="description" placeholder="Description"
                                          style="height: 100px;"></textarea>
                            <label for="description">Description</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="roomAvailable"
                                   placeholder="Room Available" min="1">
                            <label for="roomAvailable">Room Available</label>
                        </div>
                        <div class="mb-3">
                            <label for="formFileMultiple" class="form-label">Images</label>
                            <input class="form-control bg-dark" type="file" id="formFileMultiple" multiple="">
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" step="0.01" class="form-control" id="price" placeholder="Price"
                                   min="1">
                            <label for="price">Price</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="discount" value="0"
                                   placeholder="Discount" min="0">
                            <label for="discount">Discount (%)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="status">
                                <option value="true">Active</option>
                                <option value="false">Inactive</option>
                            </select>
                            <label for="status">Status</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="facilityListId">
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                            <label for="facilityListId">Facility List</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Send</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Modal End -->

    <jsp:include page="components/admin_footer.jsp"/>
</div>
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
<jsp:include page="components/js_libraries.jsp"/>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var editHotelModal = document.getElementById('editHotel');

        editHotelModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;

            var hotelId = button.getAttribute('data-hotelId');
            var name = button.getAttribute('data-name');
            var locationId = button.getAttribute('data-locationId');
            var address = button.getAttribute('data-address');
            var description = button.getAttribute('data-description');
            var roomAvailable = button.getAttribute('data-roomAvailable');
            var price = button.getAttribute('data-price');
            var discount = button.getAttribute('data-discount');
            var status = button.getAttribute('data-status');
            var facilityListId = button.getAttribute('data-facilityListId');

            document.getElementById('hotelId').value = hotelId;
            document.getElementById('name').value = name;
            document.getElementById('locationId').value = locationId;
            document.getElementById('address').value = address;
            document.getElementById('description').value = description;
            document.getElementById('roomAvailable').value = roomAvailable;
            document.getElementById('price').value = price;
            document.getElementById('discount').value = discount;
            document.getElementById('status').value = status === 'true' ? 'true' : 'false';
            document.getElementById('facilityListId').value = facilityListId;
        });
    });
</script>
</body>
</html>
