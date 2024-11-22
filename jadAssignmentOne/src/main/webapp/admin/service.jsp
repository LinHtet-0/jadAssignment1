<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Manage Services</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin.css">
     <link rel="stylesheet" href="./css/modal.css">
    <link rel="stylesheet" href="./css/service.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Manage Services</h1>
            <button class="btn btn-primary" onclick="openModal()">Add New Service</button>
        </div>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Service ID</th>
                        <th>Category ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="serviceTable">
                    <!-- Table content dynamically populated -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal" id="serviceModal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Add New Service</h2>
            <form id="serviceForm" onsubmit="handleSubmit(event)">
                <div class="form-group">
                    <label for="category_id">Category ID</label>
                    <input type="number" id="category_id" name="category_id" required>
                </div>
                <div class="form-group">
                    <label for="service_name">Service Name</label>
                    <input type="text" id="service_name" name="service_name" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" id="price" name="price" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="image_path">Image Path</label>
                    <input type="text" id="image_path" name="image_path" required>
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </div>
    <script src="./js/service.js"></script>
</body>
</html>
