<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ca1.dao.CustomerDAO, com.ca1.models.Customer" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cleaning Service Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="./index.css">
</head>

<body>
    <%@ include file="../sidebar.jsp" %>
    <div class="main-content"> 
  
       <div class="header">
            <h1>Customer Management</h1>
            <a href="#" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add New Customer
            </a>
        </div>
    	      <!-- Success or Error Messages -->
        <%
            String successMessage = (String) session.getAttribute("customerSuccess");
            String errorMessage = (String) session.getAttribute("customerError");
            if (successMessage != null) {
        %>
            <div class="notification success">
                <%= successMessage %>
                <button class="close-btn" onclick="this.parentElement.style.display='none';">&times;</button>
            </div>
        <%
                session.removeAttribute("customerSuccess");
            } else if (errorMessage != null) {
        %>
            <div class="notification error">
                <%= errorMessage %>
                <button class="close-btn" onclick="this.parentElement.style.display='none';">&times;</button>
            </div>
        <%
                session.removeAttribute("customerSuccess");
            }
        %>
         <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Address</th>
                    <th>Joined Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
           <%
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customers = customerDAO.getAllCustomers();
%>

<tbody>
    <% for (Customer customer : customers) { %>
        <tr>
            <td><%= customer.getId() %></td>
            <td><%= customer.getName() %></td>
            <td><%= customer.getEmail() %></td>
            <td><%= customer.getPhone() %></td>
            <td>
                <span class="role <%= "customer".equalsIgnoreCase(customer.getRole()) ? "role-customer" : "role-admin" %>">
                    <%= customer.getRole() %>
                </span>
            </td>
            <td><%= customer.getAddress() %></td>
            <td><%= customer.getJoinedDate() != null ? customer.getJoinedDate().toString() : "N/A" %></td>
            <td class="actions">
                <button class="icon-button btn-edit" onclick="window.location.href='edit.jsp?id=<%= customer.getId() %>'">
                    <i class="fas fa-edit"></i>
                </button>
                <% if (!"admin".equalsIgnoreCase(customer.getRole())) { %>
                    <button class="icon-button btn-delete" onclick="showDeleteModal(<%= customer.getId() %>)">
                        <i class="fas fa-trash"></i>
                    </button>
                <% } %>
            </td>
        </tr>
    <% } %>
</tbody>
        </table>
    </div>
    
      <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h2>Are you sure you want to delete this service?</h2>
            <button id="confirmDelete" onclick="deleteService()">Yes, Delete</button>
            <button onclick="closeModal()">Cancel</button>
        </div>
    </div>
    
    <script>
        // Interactive dashboard functionality can be added here
        function showDeleteModal(serviceId) {
            document.getElementById('deleteModal').style.display = "block";
            document.getElementById('deleteModal').classList.add('fade-in');
            document.getElementById('confirmDelete').setAttribute('data-customer-id', serviceId);
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
            var serviceId = document.getElementById('confirmDelete').getAttribute('data-customer-id');
            window.location.href = 'delete.jsp?customerId=' + serviceId;
        }
       
    </script>
   
</body>

</html>