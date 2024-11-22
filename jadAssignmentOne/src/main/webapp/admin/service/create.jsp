<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ca1.dao.CategoryDAO, com.ca1.dao.ServiceDAO, com.ca1.models.Category, com.ca1.models.Service" %>
<%@ page import="java.util.List , java.io.File, java.io.IOException, jakarta.servlet.http.* ,java.nio.file.Paths" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Service</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="./index.css">
</head>
<body>
    <%@ include file="../sidebar.jsp" %>

    <div class="main-content">
        <div class="header">
            <h1>Add New Service</h1>
        </div>
        <div id="serviceContainer" class="service-container">
            <div class="service-content">
                <h2 id="modalTitle">Add Service</h2>
                <!-- Use enctype for file uploads -->
                <form id="serviceForm" method="POST" action="ServiceUploadServlet" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="categoryId">Category</label>
                        <select id="categoryId" name="categoryId" required>
                            <%
                                CategoryDAO categoryDAO = new CategoryDAO();
                                List<Category> categories = categoryDAO.getCategories();
                                for (Category category : categories) {
                            %>
                                <option value="<%= category.getId() %>"><%= category.getName() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="serviceName">Service Name</label>
                        <input type="text" id="serviceName" name="serviceName" required>
                    </div>
                    <div class="form-group">
                        <label for="serviceDescription">Description</label>
                        <textarea id="serviceDescription" rows="3" name="serviceDescription" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="servicePrice">Price</label>
                        <input type="number" id="servicePrice" name="servicePrice" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="serviceImage">Image</label>
                        <input type="file" id="serviceImage" name="serviceImage" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>

            </div>
        </div>
    </div>
</body>
</html>
