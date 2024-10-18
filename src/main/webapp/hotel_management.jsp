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
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="components/admin_footer.jsp"/>
</div>
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>
