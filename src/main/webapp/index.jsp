<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <input placeholder="Current Location" type="text"/>
        <input placeholder="Check-in Date" type="date"/>
        <input placeholder="Check-out Date" type="date"/>
        <button>
            Search Hotels
        </button>
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
        <div class="location-card">
            <img alt="New York hotel room" height="200"
                 src="https://picsum.photos/1080/1440"
                 width="100"/>
            <p>
                New York
            </p>
        </div>
        <div class="location-card">
            <img alt="Paris hotel room" height="200"
                 src="https://picsum.photos/1080/1440"
                 width="100"/>
            <p>
                Paris
            </p>
        </div>
        <div class="location-card">
            <img alt="London hotel room" height="200"
                 src="https://picsum.photos/1080/1440"
                 width="100"/>
            <p>
                London
            </p>
        </div>
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
</body>

</html>