<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ca1.dao.CustomerDAO, com.ca1.models.Customer" %>

<%!
// Helper method to get customer by ID
public Customer getCustomerById(int customerId) {
    CustomerDAO customerDAO = new CustomerDAO();
    return customerDAO.getCustomerById(customerId);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="./index.css">
</head>
<body>
    <%@ include file="../sidebar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Edit Customer</h1>
        </div>

        <%
        // Get customer ID from the request
        String customerIdParam = request.getParameter("id");
        if (customerIdParam != null) {
            try {
                int customerId = Integer.parseInt(customerIdParam);

                // Fetch the customer using DAO
                Customer customer = getCustomerById(customerId);

                if (customer != null) {
        %>
        <form method="POST" action="update.jsp">
            <input type="hidden" name="customerId" value="<%= customer.getId() %>" />
            <div class="form-group">
                <label for="name">Username</label>
                <input type="text" id="name" name="name" value="<%= customer.getName() %>" required />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <textarea id="email" name="email" required><%= customer.getEmail() %></textarea>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="number" id="phone" name="phone" value="<%= customer.getPhone() %>" required />
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" required><%= customer.getAddress() %></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Customer</button>
        </form>
        <% 
                } else {
        %>
            <p>Customer not found!</p>
        <% 
                }
            } catch (NumberFormatException e) {
        %>
            <p>Invalid customer ID!</p>
        <% 
            }
        } else {
        %>
            <p>No customer ID provided!</p>
        <% 
        }
        %>
    </div>
</body>
</html>
