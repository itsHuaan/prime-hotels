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
    <link rel="stylesheet" href="css/style.css">
    <style>
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
                    <a href="HotelListServlet?locationId=${item.locationId}" onclick="setDropdownValue('${item.name}')">${item.name}</a>
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