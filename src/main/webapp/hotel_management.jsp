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
                        <h6>Hotel Management</h6>
                        <button
                                type="button"
                                class="btn btn-primary m-2"
                                data-bs-toggle="modal"
                                data-bs-target="#addHotel">
                            <i class="bi bi-plus"></i>
                            Add new hotel
                        </button>
                    </div>
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
                                    <td>
                                        <c:if test="${item.status == 1}">
                                            Active
                                        </c:if>
                                        <c:if test="${item.status == 0}">
                                            Inactive
                                        </c:if>
                                    </td>
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
                                                data-bs-target="#deleteHotel"
                                                data-hotelId="${item.hotelId}"
                                                data-name="${item.name}">
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

    <!-- Add new Modal Start -->
    <div
            class="modal fade"
            id="addHotel"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-secondary">
                <form action="SaveServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white">
                            Add new hotel
                        </h5>
                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <input
                                type="hidden"
                                name="sourcePage"
                                value="hotelManagementPage"
                        />
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    name="hotelId"
                                    placeholder="Hotel ID"
                            />
                            <label for="hotelId">Hotel ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    name="name"
                                    placeholder="Hotel Name"
                            />
                            <label for="name">Hotel Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select
                                    class="form-select"
                                    name="locationId"
                            >
                                <c:forEach var="item" items="${locations}">
                                    <option value="${item.locationId}">${item.name}</option>
                                </c:forEach>
                            </select>
                            <label for="locationId">Location</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    name="address"
                                    placeholder="Address"
                            />
                            <label for="address">Address</label>
                        </div>
                        <div class="form-floating mb-3">
                    <textarea
                            class="form-control"
                            name="description"
                            placeholder="Description"
                            style="height: 100px"
                    ></textarea>
                            <label for="description">Description</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="number"
                                    class="form-control"
                                    name="roomAvailable"
                                    placeholder="Room Available"
                                    min="1"
                            />
                            <label for="roomAvailable">Room Available</label>
                        </div>
                        <div class="mb-3">
                            <label for="formFileMultiple" class="form-label"
                            >Images</label
                            >
                            <input
                                    class="form-control bg-dark"
                                    type="file"
                                    name="image"
                                    multiple=""
                            />
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    name="price"
                                    placeholder="Price"
                                    min="1"
                            />
                            <label for="price">Price</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input
                                    type="number"
                                    class="form-control"
                                    name="discount"
                                    value="0"
                                    placeholder="Discount"
                                    min="0"
                            />
                            <label for="discount">Discount (%)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" name="status">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                            <label for="status">Status</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select
                                    class="form-select"
                                    name="facilityListId"
                            >
                                <c:forEach var="item" items="${facilities}">
                                    <option value="${item.facilityListId}">
                                            ${item.name}
                                    </option>
                                </c:forEach>
                            </select>
                            <label for="facilityListId">Facility List</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Add new Modal End -->

    <!-- Edit Modal Start -->
    <div class="modal fade" id="editHotel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-secondary">
                <form action="SaveServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Edit Hotel Information</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="sourcePage" value="hotelManagementPage">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="hotelId" name="hotelId" placeholder="Hotel ID">
                            <label for="hotelId">Hotel ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Hotel Name">
                            <label for="name">Hotel Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="locationId" name="locationId">
                                <c:forEach var="item" items="${locations}">
                                    <option value="${item.locationId}">${item.name}</option>
                                </c:forEach>
                            </select>
                            <label for="locationId">Location</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                            <label for="address">Address</label>
                        </div>
                        <div class="form-floating mb-3">
                                <textarea class="form-control" id="description" name="description"
                                          placeholder="Description"
                                          style="height: 100px;"></textarea>
                            <label for="description">Description</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="roomAvailable" name="roomAvailable"
                                   placeholder="Room Available" min="1">
                            <label for="roomAvailable">Room Available</label>
                        </div>
                        <div class="mb-3">
                            <label for="formFileMultiple" class="form-label">Images</label>
                            <input class="form-control bg-dark" type="file" id="formFileMultiple" name="image"
                                   multiple="">
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" step="0.01" class="form-control" id="price" name="price"
                                   placeholder="Price"
                                   min="1">
                            <label for="price">Price</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="discount" name="discount" value="0"
                                   placeholder="Discount" min="0">
                            <label for="discount">Discount (%)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="status" name="status">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                            <label for="status">Status</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="facilityListId" name="facilityListId">
                                <c:forEach var="item" items="${facilities}">
                                    <option value="${item.facilityListId}">${item.name}</option>
                                </c:forEach>
                            </select>
                            <label for="facilityListId">Facility List</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal End -->

    <!-- Delete Modal Start -->
    <div class="modal fade" id="deleteHotel" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-secondary">
                <form action="DeleteServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title text-white" id="deleteModalLabel">Delete Hotel</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this hotel?</p>
                        <p id="deleteHotelName" class="text-danger font-weight-bold"></p>
                        <input type="hidden" id="_hotelId" name="_hotelId" value="">
                        <input type="hidden" name="_sourcePage" value="hotelManagementPage">
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
        let deleteHotelModal = document.getElementById('deleteHotel');
        deleteHotelModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            document.getElementById('_hotelId').value = button.getAttribute('data-hotelId');
        });
    });



    document.addEventListener('DOMContentLoaded', function () {
        let editHotelModal = document.getElementById('editHotel');

        editHotelModal.addEventListener('show.bs.modal', function (event) {
            let button = event.relatedTarget;

            let hotelId = button.getAttribute('data-hotelId');
            let name = button.getAttribute('data-name');
            let locationId = button.getAttribute('data-locationId');
            let address = button.getAttribute('data-address');
            let description = button.getAttribute('data-description');
            let roomAvailable = button.getAttribute('data-roomAvailable');
            let price = button.getAttribute('data-price');
            let discount = button.getAttribute('data-discount');
            let status = button.getAttribute('data-status');
            let facilityListId = button.getAttribute('data-facilityListId');

            document.getElementById('hotelId').value = hotelId;
            document.getElementById('name').value = name;
            document.getElementById('locationId').value = locationId;
            document.getElementById('address').value = address;
            document.getElementById('description').value = description;
            document.getElementById('roomAvailable').value = roomAvailable;
            document.getElementById('price').value = price;
            document.getElementById('discount').value = discount;
            document.getElementById('status').value = status === "1" ? "1" : "0";
            document.getElementById('facilityListId').value = facilityListId;
        });
    });
</script>
</body>
</html>
