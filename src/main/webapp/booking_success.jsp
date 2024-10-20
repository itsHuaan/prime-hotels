<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Reservation Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #4CAF50;
            text-align: center;
        }

        .information {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: start;
        }

        p {
            font-size: 16px;
            line-height: 1.5;
            text-align: center;
        }

        .button {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 20px 0;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s;
            box-sizing: border-box;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Reservation Confirmed!</h1>
    <div class="information">
        <p>Your reservation ID: <strong>${reservation.reservationId}</strong></p>
        <p>Hotel: <strong>${hotel.name}</strong></p>
        <p>Check-in Date: <strong>${reservation.checkIn}</strong></p>
        <p>Check-out Date: <strong>${reservation.checkOut}</strong></p>
        <p>Deposit Amount: <strong>$${reservation.deposit}</strong></p>
        <p>Reservation Date: <strong>${reservation.createdAt}</strong></p>
    </div>
    <p>Thank you for choosing us. We look forward to welcoming you!</p>
    <a href="HomepageServlet" class="button">Back to Home</a>
</div>
</body>
</html>
