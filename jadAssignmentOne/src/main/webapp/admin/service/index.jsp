<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ca1.dao.CategoryDAO, com.ca1.dao.ServiceDAO, com.ca1.models.Category, com.ca1.models.Service" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Services</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="./index.css">
</head>
<body>
    <%@ include file="../sidebar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>All Services</h1>
            <button class="btn btn-primary" id="addServiceBtn" onclick="window.location.href='./create.jsp'">
                <i class="fas fa-plus"></i> Add New Service
            </button>
        </div>

        <!-- Success or Error Messages -->
        <%
            String successMessage = (String) session.getAttribute("serviceSuccess");
            String errorMessage = (String) session.getAttribute("serviceError");
            if (successMessage != null) {
        %>
            <div class="notification success">
                <%= successMessage %>
                <button class="close-btn" onclick="this.parentElement.style.display='none';">&times;</button>
            </div>
        <%
                session.removeAttribute("serviceSuccess");
            } else if (errorMessage != null) {
        %>
            <div class="notification error">
                <%= errorMessage %>
                <button class="close-btn" onclick="this.parentElement.style.display='none';">&times;</button>
            </div>
        <%
                session.removeAttribute("serviceError");
            }
        %>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>Service ID</th>
                    <th>Service Name</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="categoryTable">
                <%
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ServiceDAO serviceDAO = new ServiceDAO();
                    List<Service> services = serviceDAO.getAllServices();

                    for (Service service : services) {
                        Category category = categoryDAO.getCategoryById(service.getCategoryId());
                %>
                    <tr>
                        <td><%= service.getId() %></td>
                        <td><%= service.getServiceName() %></td>
                        <td><%= category != null ? category.getName() : "Uncategorized" %></td>
                        <td><%= service.getDescription() %></td>
                        <td>$<%= service.getPrice() %></td>
                        <td>
                            <% if (service.getImagePath() != null && !service.getImagePath().isEmpty()) { %>
                                <img src="<%= service.getImagePath() %>" alt="<%= service.getServiceName() %>" style="width:50px; height:50px; border-radius:5px;">
                            <% } else { %>
                                No Image
                            <% } %>
                        </td>
                        <td>
                            <button class="icon-button btn-edit" onclick="window.location.href='./edit.jsp?id=<%= service.getId() %>'">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="icon-button btn-delete" onclick="showDeleteModal(<%= service.getId() %>)">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h2>Are you sure you want to delete this service?</h2>
            <button id="confirmDelete" onclick="deleteService()">Yes, Delete</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </div>

    <script>
        function showDeleteModal(serviceId) {
            document.getElementById('deleteModal').style.display = "block";
            document.getElementById('deleteModal').classList.add('fade-in');
            document.getElementById('confirmDelete').setAttribute('data-service-id', serviceId);
        }

        function closeModal() {
            var modal = document.getElementById('deleteModal');
            modal.classList.add('fade-out');
            setTimeout(function () {
                modal.style.display = "none";
                modal.classList.remove('fade-out');
            }, 300);
        }

        function deleteService() {
            var serviceId = document.getElementById('confirmDelete').getAttribute('data-service-id');
            window.location.href = 'delete.jsp?serviceId=' + serviceId;
        }
        setTimeout(function() {
            var notification = document.querySelector('.notification');
            if (notification) {
                // Add fade-out class for opacity transition
                notification.classList.add('fade-out');

                // After the fade-out transition ends, completely remove the notification
                notification.addEventListener('transitionend', function() {
                    notification.style.display = 'none';  // Remove from layout
                });
            }
        }, 5000); 
    </script>
</body>
</html>
