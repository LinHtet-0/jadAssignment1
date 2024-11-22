<%
// Get the current URI path
String currentPath = request.getRequestURI();
%>

<div class="sidebar">
    <div class="sidebar-logo">Zen.Home Cleaning Admin</div>
    <ul class="sidebar-menu">
        <li>
            <a href="../dashboard/index.jsp" class="<%= currentPath.contains("/dashboard.jsp") ? "active" : "" %>">
                <i class="fas fa-home"></i> Dashboard
            </a>
        </li>
        <li>
            <a href="../customer/index.jsp" class="<%= currentPath.contains("/customer/") ? "active" : "" %>">
                <i class="fas fa-users"></i> Customers
            </a>
        </li>
        <li>
            <a href="../booking/index.jsp" class="<%= currentPath.contains("/booking/") ? "active" : "" %>">
                <i class="fas fa-book"></i> Bookings
            </a>
        </li>
        <li>
            <a href="../category/index.jsp" class="<%= currentPath.contains("/category/") ? "active" : "" %>">
                <i class="fas fa-tags"></i> Service Categories
            </a>
        </li>
        <li>
            <a href="../service/index.jsp" class="<%= currentPath.contains("/service/") ? "active" : "" %>">
                <i class="fas fa-list"></i> Services
            </a>
        </li>
     <%--    <li>
            <a href="#" class="<%= currentPath.contains("/reports/") ? "active" : "" %>">
                <i class="fas fa-chart-bar"></i> Reports
            </a>
        </li>
        <li>
            <a href="#" class="<%= currentPath.contains("/settings/") ? "active" : "" %>">
                <i class="fas fa-cog"></i> Settings
            </a>
        </li>
    </ul> --%>
</div>