<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>
        Prime Hotels
    </title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <script src="js/script.js"></script>
    <style>
        body {
            margin-top: 90px;
            font-family: 'Roboto', sans-serif;
        }

        .hero {
            background-image: url('https://picsum.photos/1920/1080');
            background-size: cover;
            background-position: center;
            color: #fff;
            text-align: center;
            height: 40vw;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 20px;
        }

        .hero h2 {
            font-size: 36px;
            margin: 0;
        }

        .hero p {
            font-size: 18px;
            margin: 10px 0 30px;
        }

        hr {
            margin: 0 2rem 0;
        }


        .search-bar {
            display: flex;
            justify-content: center;
            gap: 50px;
            margin-top: 50px;
        }

        .button {
            width: 30vh;
            display: flex;
            align-items: center;
            padding: 25px 20px;
            border-radius: 20px;
            font-family: Arial, sans-serif;
            font-size: 16px;
            cursor: pointer;
        }

        .button i {
            margin-right: 10px;
        }

        .location-button,
        .date-button {
            background-color: #ffffff;
            color: #000000;
            border: 1px solid #ccc;
            transition: background-color 0.3s, transform 0.3s;
        }

        .location-button:hover,
        .date-button:hover {
            background-color: #f0f0f0;
            transform: translateY(-2px);
        }

        .search-button {
            background-color: #000000;
            color: #ffffff;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            max-height: 400px;
            overflow-y: auto;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 100;
            border-radius: 10px;
            transition: opacity 0.3s;
            margin-top: 10px;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
            cursor: pointer;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            opacity: 1;
        }

        .sub-dropdown {
            position: relative;
        }

        .sub-dropdown-content {
            display: none;
            position: absolute;
            left: 100%;
            top: 0;
            min-width: 160px;
            background-color: #f9f9f9;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
        }

        .sub-dropdown:hover .sub-dropdown-content {
            display: block;
        }

        .member-section {
            display: flex;
            align-items: center;
            padding: 1in 3in;
        }

        .member-section .text {
            flex: 1;
        }

        .member-section h3 {
            font-size: 24px;
            margin: 0;
        }

        .member-section p {
            font-size: 16px;
            margin: 10px 0;
        }

        .member-section button {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .member-section .image {
            flex: 1;
            text-align: right;
        }

        .locations {
            text-align: center;
            padding: 50px 20px;
        }

        .locations h3 {
            font-size: 24px;
            margin: 0 0 30px;
        }

        .locations .location-cards {
            display: flex;
            overflow-x: auto;
            gap: 1rem;
            padding: 10px;
        }

        .locations .location-card {
            position: relative;
            min-width: 30vh;
            max-width: 30vh;
            border-radius: 15px;
            overflow: hidden;
            flex-shrink: 0;
        }

        .locations .location-card img {
            width: 100%;
            height: 100%;
        }

        .locations .location-card p {
            width: 50%;
            position: absolute;
            bottom: 0px;
            right: 0px;
            background-color: rgba(0, 0, 0, 0.9);
            color: #fff;
            margin: 0;
            padding: 5px 10px;
            border-bottom-right-radius: 15px;
            border-top-left-radius: 15px;
            font-size: 0.8rem;
        }

        .faq {
            text-align: center;
            padding: 50px 20px;
        }

        .faq h3 {
            font-size: 24px;
            margin: 0 0 30px;
        }

        .faq .faq-item {
            background-color: #000;
            color: #fff;
            padding: 30px;
            margin: 10px 0;
            border-radius: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #f8f8f8;
        }

        .footer p {
            margin: 0;
            font-size: 14px;
        }

        .footer .social-icons {
            margin: 10px 0;
        }

        .footer .social-icons i {
            margin: 0 5px;
            color: #000;
            cursor: pointer;
        }

        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            transition: width 0.2s, height 0.2s;
        }

        .location-cards:hover::-webkit-scrollbar-thumb {
            background-color: rgba(0, 0, 0, 0.7);
        }
    </style>
</head>

<body>
<jsp:include page="components/header.jsp"/>
<div class="hero">
    <h2>
        Experience The Difference
    </h2>
    <p>
        Plan.Book.Travel
    </p>
    <div class="search-bar">
        <div class="button location-button dropdown">
            <i class="fas fa-location-arrow"></i>
            <span id="dropdownText">Current Location</span>
            <div class="dropdown-content">
                <c:forEach var="item" items="${locations}">
                    <a href="HotelListServlet?locationId=${item.locationId}"
                       onclick="setDropdownValue('${item.name}')">${item.name}</a>
                </c:forEach>
            </div>
        </div>
        <div class="button date-button">
            <i class="fas fa-calendar-alt"></i>
            <span>01 March - 05 March</span>
        </div>
        <div class="button search-button">
            <i class="fas fa-search"></i>
            <span>Search Hotels</span>
        </div>
    </div>
</div>
<div class="member-section">
    <div class="text">
        <h3>
            Become a Member
        </h3>
        <p>
            Exclusive offers, rate and locations
        </p>
        <button>
            Join Now
        </button>
    </div>
    <div class="image">
        <img alt="Illustration of a tent with a bird" height="200"
             src="https://img.freepik.com/free-vector/camping-place-cartoon-composition-with-yellow-tent-lamp-pot-with-dinner-fire-night-sky_1284-54945.jpg"
             width="300"/>
    </div>
</div>
<hr>
<div class="locations">
    <h3>
        Our Locations
    </h3>
    <div class="location-cards">
        <c:forEach var="item" items="${locations}">
            <div class="location-card">
                <a href="HotelListServlet?locationId=${item.locationId}">
                    <img alt="" height="200"
                         src="https://picsum.photos/1080/1440?random=${item.locationId}"
                         width="100"/>
                    <p>
                            ${item.name}
                    </p>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<hr>
<div class="faq">
    <h3>
        FAQ's
    </h3>
    <div class="faq-item">
            <span>
                What is your policy regarding cancellations?
            </span>
        <i class="fas fa-chevron-right">
        </i>
    </div>
    <div class="faq-item">
            <span>
                How do I know that my reservation is confirmed?
            </span>
        <i class="fas fa-chevron-right">
        </i>
    </div>
    <div class="faq-item">
            <span>
                Top Destinations
            </span>
        <i class="fas fa-chevron-right">
        </i>
    </div>
    <div class="faq-item">
            <span>
                Our Company
            </span>
        <i class="fas fa-chevron-right">
        </i>
    </div>
</div>

<jsp:include page="components/footer.jsp"/>
<script>
    function setDropdownValue(value) {
        document.getElementById("dropdownText").innerText = value;
        const dropdownContent = document.querySelector('.dropdown-content');
        dropdownContent.style.display = 'none';
    }

    document.querySelector('.dropdown').addEventListener('mouseenter', function () {
        document.querySelector('.dropdown-content').style.display = 'block';
    });

    document.querySelector('.dropdown').addEventListener('mouseleave', function () {
        document.querySelector('.dropdown-content').style.display = 'none';
    });

    const subDropdown = document.querySelector('.sub-dropdown');
    subDropdown.addEventListener('mouseenter', function () {
        this.querySelector('.sub-dropdown-content').style.display = 'block';
    });

    subDropdown.addEventListener('mouseleave', function () {
        this.querySelector('.sub-dropdown-content').style.display = 'none';
    });
</script>
</body>

</html>