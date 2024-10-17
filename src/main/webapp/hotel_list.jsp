<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16-Oct-24
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>
        Prime Hotels
    </title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin-top: 90px;
            padding: 0;
            background-color: #f5f5f5;
        }

        .sort-by {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin: 20px 20px;
        }

        .sort-by button {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px 20px;
            margin: 0 10px;
            cursor: pointer;
            border-radius: 20px;
        }

        .hotel-list {
            max-width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .hotel {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin: 20px 0;
            display: flex;
            align-items: stretch;
            position: relative;
            min-height: 150px;
            width: 60%;
            max-width: 100%;
            justify-content: space-between;
        }

        .hotel img {
            width: 30vh;
            height: auto;
            border-radius: 10px 0 0 10px;
            object-fit: cover;
            flex-shrink: 0;
            margin-right: 20px;
        }

        .hotel-details {
            margin-top: 10px;
            flex: 1;
            padding-left: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }

        .hotel-details h2 {
            margin: 0;
            font-size: 24px;
        }

        .hotel-details p {
            margin: 5px 0;
            color: #666;
        }

        .hotel-details .rating {
            color: #f39c12;
        }

        .hotel-details .amenities {
            display: flex;
            margin: 10px 0;
        }

        .hotel-details .amenities span {
            margin-right: 20px;
            display: flex;
            align-items: center;
        }

        .hotel-details .amenities span i {
            margin-right: 5px;
        }

        .hotel-price {
            margin: auto 10px 10px 0;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        .hotel-price .current-price {
            font-size: 3rem;
            color: #000000;
            font-weight: bold;
        }

        .hotel-price .original-price {
            text-decoration: line-through;
            color: #999;
            font-size: 18px;
        }

        .hotel-price .discount {
            background-color: #e74c3c;
            color: #fff;
            padding: 3px 6px;
            border-radius: 5px;
            font-size: 14px;
        }

        .hotel-price button {
            background-color: #000;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 20px;
            margin-top: 10px;
        }

        .price-discount {
            margin-right: 10px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .price-line {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .per-night {
            margin-top: 5px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>

<body>
<jsp:include page="components/header.jsp"/>
<div class="sort-by">
        <span>
            Sort By:
        </span>
    <button>
        Rating
    </button>
    <button>
        Affordable
    </button>
</div>
<div class="hotel-list">
    <c:forEach var="item" items="${hotels}">
        <div class="hotel">
            <img alt="" height="150"
                 src="https://picsum.photos/1440/1440?random=${item.hotelId}"
                 width="150">
            <div class="hotel-details">
                <h2>${item.name}</h2>
                <p>${item.address}</p>
                <p class="rating">
                    <i class="fas fa-star"></i>
                        ${item.rating}
                </p>
                <div class="amenities">
                    <span><i class="fas fa-check-circle"></i> Room Service</span>
                    <span><i class="fas fa-check-circle"></i> Restaurant</span>
                    <span><i class="fas fa-check-circle"></i> Spa</span>
                    <span><i class="fas fa-check-circle"></i> Parking</span>
                </div>
                <div class="hotel-price">
                    <div class="price-discount">
                        <div class="price-line">
                            <span class="current-price">$${item.price - (item.price * (item.discount/100))}</span>
                            <span class="original-price">$${item.price}</span>
                            <span class="discount">${item.discount}% OFF</span>
                        </div>
                        <p class="per-night">per night/room</p>
                    </div>
                    <a href="BookingServlet?hotelId=${item.hotelId}">
                        <button>View More Details</button>
                    </a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>

</html>
