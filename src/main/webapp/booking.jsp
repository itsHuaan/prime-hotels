<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16-Oct-24
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Booking</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        hr {
            margin: 2em 0;
        }

        .price-details input:focus{
            outline: none;
        }

        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .container {
            width: 70%;
            margin: 20px auto;
            border-radius: 10px;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .header p {
            margin: 0;
            color: #666;
        }

        .header .rating {
            display: flex;
            align-items: center;
        }

        .header .rating i {
            color: #f5c518;
        }

        .header .rating span {
            margin-left: 5px;
            color: #666;
        }

        .images {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .images img {
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        .images .main-image {
            flex: 2;
            max-height: 30vw;
        }

        .images .side-images {
            flex: 1;
            max-height: 15vw;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .facilities-pricing {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .facilities {
            display: flex;
            flex-direction: column;
            flex: 1;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-right: 10px;
        }

        .facilities h2 {
            margin-top: 0;
        }

        .facilities ul {
            list-style: none;
            padding: 0;
        }

        .facilities ul li {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .facilities ul li i {
            color: #28a745;
            margin-right: 10px;
        }

        .pricing {
            flex: 1;
            /* Allows pricing to grow */
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .pricing h2 {
            margin-top: 0;
        }

        .pricing .price-details {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 15px;
        }

        .pricing .price-details div {
            flex: 1;
            text-align: center;
        }

        .pricing .reserve-button {
            display: block;
            width: 100%;
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            border-radius: 15px;
            text-decoration: none;
            margin-top: 20px;
        }

        .pricing .total {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
        }

        .rating-and-reviews {
            font-size: 24px;
            font-weight: bold;
            margin: 20px 0;
        }

        .rating-summary {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .rating-score {
            background-color: #4CAF50;
            color: white;
            font-size: 24px;
            font-weight: bold;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 100px;
            margin-right: 20px;
        }

        .rating-bars {
            flex-grow: 1;
        }

        .rating-bar {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .rating-bar span {
            margin-right: 10px;
            font-size: 14px;
        }

        .bar {
            flex-grow: 1;
            height: 10px;
            border-radius: 5px;
            background-color: #e0e0e0;
            position: relative;
        }

        .bar-fill {
            height: 100%;
            border-radius: 5px;
            position: absolute;
            top: 0;
            left: 0;
        }

        .bar-fill-5 {
            width: 84%;
            background-color: #4CAF50;
        }

        .bar-fill-4 {
            width: 9%;
            background-color: #8BC34A;
        }

        .bar-fill-3 {
            width: 4%;
            background-color: #FFC107;
        }

        .bar-fill-2 {
            width: 2%;
            background-color: #FF9800;
        }

        .bar-fill-1 {
            width: 1%;
            background-color: #F44336;
        }

        .rating-bar span:last-child {
            margin-left: 10px;
        }

        .reviews {
            margin-top: 20px;
        }

        .review {
            display: flex;
            align-items: center;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .review-rating {
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            width: 50px;
            margin-right: 20px;
        }

        .review-rating-5 {
            background-color: #4CAF50;
        }

        .review-rating-4 {
            background-color: #8BC34A;
        }

        .review-rating-3 {
            background-color: #FFC107;
        }

        .review-rating-2 {
            background-color: #FF9800;
        }

        .review-rating-1 {
            background-color: #F44336;
        }

        .review-content {
            flex-grow: 1;
        }

        .review-content .name {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .review-content .date {
            font-size: 12px;
            color: #888;
            margin-bottom: 10px;
        }

        .review-content .text {
            font-size: 14px;
            color: #333;
        }

        .read-all {
            text-align: center;
            margin-top: 20px;
        }

        .read-all button {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<c:set var="discountedPrice" value="${hotel.price - (hotel.price * (hotel.discount / 100))}"/>
<div class="container">
    <div class="header">
        <div>
            <h1>${hotel.name}</h1>
            <p>${hotel.address}</p>
        </div>
        <div class="rating">
            <i class="fas fa-star"></i>
            <span>${hotel.rating}</span>
        </div>
    </div>
    <div class="images">
        <div class="main-image">
            <img alt=""
                 height="400"
                 src="https://picsum.photos/1920/1080?random=1"
                 width="600"/>
        </div>
        <div class="side-images">
            <img alt=""
                 height="200"
                 src="https://picsum.photos/1920/1080?random=2"
                 width="300"/>
            <img alt="" height="200"
                 src="https://picsum.photos/1920/1080?random=3"
                 width="300"/>
        </div>
    </div>
    <div class="facilities-pricing">
        <div class="facilities">
            <h2>Facilities</h2>
            <ul>
                <c:forEach var="item" items="${facilities}">
                    <li><i class="fas fa-check-circle"></i> ${item}</li>
                </c:forEach>
            </ul>
        </div>
        <div class="pricing">
            <h2>$${hotel.price - (hotel.price * (hotel.discount/100))} per night</h2>
            <div class="price-details">
                <div>
                    <p>CHECK-IN</p>
                    <input type="date" id="checkin" value="2023-01-01"
                           style="border: none; background: none; text-align: center; padding: 0; font-size: 1rem; color: inherit; margin-bottom: 10px;"/>
                </div>
                <div>
                    <p>CHECK-OUT</p>
                    <input type="date" id="checkout" value="2023-01-05"
                           style="border: none; background: none; text-align: center; padding: 0; font-size: 1rem; color: inherit; margin-bottom: 10px;"/>
                </div>
                <div style="text-align: center;">
                    <p>GUESTS</p>
                    <input type="number" id="guests" value="2" min="1"
                           style="border: none; background: none; text-align: center; padding: 0; font-size: 1rem; color: inherit; width: 50px; margin-bottom: 10px;"/>
                </div>
            </div>
            <a class="reserve-button" href="#">Reserve</a>
            <p style="text-align: center; color: #666; margin-top: 10px;">Click above to proceed</p>
            <div class="total">
                <p>$${discountedPrice} * 5 nights</p>
                <p>$${discountedPrice * 5}</p>
            </div>
            <div class="total">
                <p>Tax and Hospitality fees (10%)</p>
                <p>$${(discountedPrice * 5) * 0.1}</p>
            </div>
            <div class="total">
                <p>Total price after tax</p>
                <p>
                    $${((discountedPrice * 5) * 0.1)+(discountedPrice * 5)}</p>
            </div>
        </div>
    </div>
    <hr>
    <div class="rating-and-reviews">Rating and Reviews</div>
    <div class="rating-summary">
        <div class="rating-score">4.8/5</div>
        <div class="rating-bars">
            <div class="rating-bar">
                <span>5</span>
                <div class="bar">
                    <div class="bar-fill bar-fill-5"></div>
                </div>
                <span>84%</span>
            </div>
            <div class="rating-bar">
                <span>4</span>
                <div class="bar">
                    <div class="bar-fill bar-fill-4"></div>
                </div>
                <span>9%</span>
            </div>
            <div class="rating-bar">
                <span>3</span>
                <div class="bar">
                    <div class="bar-fill bar-fill-3"></div>
                </div>
                <span>4%</span>
            </div>
            <div class="rating-bar">
                <span>2</span>
                <div class="bar">
                    <div class="bar-fill bar-fill-2"></div>
                </div>
                <span>2%</span>
            </div>
            <div class="rating-bar">
                <span>1</span>
                <div class="bar">
                    <div class="bar-fill bar-fill-1"></div>
                </div>
                <span>1%</span>
            </div>
        </div>
    </div>
    <div class="reviews">
        <div class="review">
            <div class="review-rating review-rating-4">4/5</div>
            <div class="review-content">
                <div class="name">Brooklyn Simmons</div>
                <div class="date">2 Days Ago</div>
                <div class="text">Lorem ipsum dolor sit amet consectetur. Nulla nibh sed lectus aliquet. Posuere
                    orci turpis
                    dui tincidunt sodales dui.
                </div>
            </div>
        </div>
        <div class="review">
            <div class="review-rating review-rating-5">5/5</div>
            <div class="review-content">
                <div class="name">Darlene Robertson</div>
                <div class="date">2 Days Ago</div>
                <div class="text">Lorem ipsum dolor sit amet consectetur. Nulla nibh sed lectus aliquet. Posuere
                    orci turpis
                    dui tincidunt sodales dui.
                </div>
            </div>
        </div>
        <div class="review">
            <div class="review-rating review-rating-3">3/5</div>
            <div class="review-content">
                <div class="name">Jacob Jones</div>
                <div class="date">2 Days Ago</div>
                <div class="text">Lorem ipsum dolor sit amet consectetur. Nulla nibh sed lectus aliquet. Posuere
                    orci turpis
                    dui tincidunt sodales dui.
                </div>
            </div>
        </div>
        <div class="review">
            <div class="review-rating review-rating-4">4/5</div>
            <div class="review-content">
                <div class="name">Jane Cooper</div>
                <div class="date">2 Days Ago</div>
                <div class="text">Lorem ipsum dolor sit amet consectetur. Nulla nibh sed lectus aliquet. Posuere
                    orci turpis
                    dui tincidunt sodales dui.
                </div>
            </div>
        </div>
    </div>
    <div class="read-all">
        <button>Read All Reviews</button>
    </div>
    <hr>
</div>
</body>

</html>
