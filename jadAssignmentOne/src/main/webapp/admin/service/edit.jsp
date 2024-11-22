<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ca1.dao.CategoryDAO, com.ca1.dao.ServiceDAO, com.ca1.models.Category, com.ca1.models.Service" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Service</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="./index.css">
</head>
<body>
    <%@ include file="../sidebar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Edit Service</h1>
        </div>

        <%
            String idParam = request.getParameter("id");
            int serviceId = Integer.parseInt(idParam);

            ServiceDAO serviceDAO = new ServiceDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            Service service = serviceDAO.getServiceById(serviceId);
            List<Category> categories = categoryDAO.getCategories();

            if (service == null) {
                session.setAttribute("serviceError", "Service not found.");
                response.sendRedirect("./index.jsp");
                return;
            }
        %>

        <form id="editServiceForm" method="POST" action="<%=request.getContextPath()%>/UpdateServiceServlet" enctype="multipart/form-data">
            <input type="hidden" name="serviceId" value="<%= service.getId() %>">
            <div class="form-group">
                <label for="categoryId">Category</label>
                <select id="categoryId" name="categoryId" required>
                    <%
                        for (Category category : categories) {
                            String selected = category.getId() == service.getCategoryId() ? "selected" : "";
                    %>
                        <option value="<%= category.getId() %>" <%= selected %>><%= category.getName() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="serviceName">Service Name</label>
                <input type="text" id="serviceName" name="serviceName" value="<%= service.getServiceName() %>" required>
            </div>
            <div class="form-group">
                <label for="serviceDescription">Description</label>
                <textarea id="serviceDescription" name="serviceDescription" required><%= service.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <label for="servicePrice">Price</label>
                <input type="number" id="servicePrice" name="servicePrice" step="0.01" value="<%= service.getPrice() %>" required>
            </div>
            <div class="form-group">
                <label for="serviceImage">Image</label>
                <input type="file" id="serviceImage" name="serviceImage" accept="image/*">
                <% if (service.getImagePath() != null && !service.getImagePath().isEmpty()) { %>
                    <img src="<%= service.getImagePath() %>" alt="<%= service.getServiceName() %>" style="width:100px; height:100px; margin-top:10px;">
                <% } %>
            </div>
            <button type="submit" class="btn btn-primary">Update Service</button>
        </form>
    </div>
</body>
</html>
