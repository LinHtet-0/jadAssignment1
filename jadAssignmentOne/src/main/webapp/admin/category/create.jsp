<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ca1.dao.CategoryDAO, com.ca1.models.Category" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="./index.css">
 
</head>
<body>
    <%@ include file="../sidebar.jsp" %>

    <div class="main-content">
        <div class="header">
            <h1>Add New Category</h1>
        </div>
       <div id="categoryContainer" class="category-container">
       
		    <div class="category-content">
		        <span class="close-btn" id="closeBtn">&times;</span>
		        <h2 id="modalTitle">Add Category</h2>
		        <form id="categoryForm" method="POST" action="create.jsp">
		            <div class="form-group">
		                <label for="categoryName">Name</label>
		                <input type="text" id="categoryName" name="categoryName" required>
		            </div>
		            <div class="form-group">
		                <label for="categoryDescription">Description</label>
		                <textarea id="categoryDescription" rows="3" name="categoryDescription" required></textarea>
		            </div>
		            <button type="submit" class="btn btn-primary">Submit</button>
		        </form>
		         <% 
            // Check if the form is submitted and handle the category creation logic
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String categoryName = request.getParameter("categoryName");
                String categoryDescription = request.getParameter("categoryDescription");

                CategoryDAO categoryDAO = new CategoryDAO();
                Category newCategory = new Category(categoryName, categoryDescription);

                boolean isCreated = categoryDAO.addCategory(newCategory);

                if (isCreated) {
                    // Set success message in session
                    session.setAttribute("categorySuccess", "Category created successfully!");
                    response.sendRedirect("./index.jsp"); // Redirect to the categories list page
                } else {
                    // Error handling (optional)
                    out.println("<p>Error: Unable to create category.</p>");
                }
            }
        %>
		    </div>
		</div>
    </div>
  
</body>
</html>