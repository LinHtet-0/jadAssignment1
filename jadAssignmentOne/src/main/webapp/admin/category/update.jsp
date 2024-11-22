<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ca1.dao.CategoryDAO, com.ca1.models.Category" %>

<%! 
    // Helper method to update category
    public boolean updateCategory(int categoryId, String categoryName, String categoryDescription) {
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = new Category(categoryId, categoryName, categoryDescription);
        return categoryDAO.updateCategory(category);
    }
%>

<%
    // Get form data
    String categoryIdParam = request.getParameter("categoryId");
    String categoryName = request.getParameter("categoryName");
    String categoryDescription = request.getParameter("categoryDescription");
    
    if (categoryIdParam != null && categoryName != null && categoryDescription != null) {
        int categoryId = Integer.parseInt(categoryIdParam);
        
        // Update the category
        boolean updateSuccess = updateCategory(categoryId, categoryName, categoryDescription);
        
        if (updateSuccess) {
            session.setAttribute("categorySuccess", "Category updated successfully!");
            response.sendRedirect("./index.jsp");
        } else {
            session.setAttribute("categoryError", "Error updating category.");
            response.sendRedirect("./index.jsp");
        }
    } else {
        session.setAttribute("categoryError", "Invalid data.");
        response.sendRedirect("./index.jsp");
    }
%>
