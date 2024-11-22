<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cleaning Service Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="main-content">
        <h1>Dashboard Overview</h1>
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <i class="fas fa-users card-icon"></i>
                <div class="card-value">245</div>
                <p>Total Customers</p>
            </div>
            <div class="dashboard-card">
                <i class="fas fa-calendar-check card-icon"></i>
                <div class="card-value">56</div>
                <p>Active Bookings</p>
            </div>
            <div class="dashboard-card">
                <i class="fas fa-dollar-sign card-icon"></i>
                <div class="card-value">$8,750</div>
                <p>Monthly Revenue</p>
            </div>
            <div class="dashboard-card">
                <i class="fas fa-star card-icon"></i>
                <div class="card-value">4.7</div>
                <p>Average Rating</p>
            </div>
        </div>
    </div>
</body>
</html>