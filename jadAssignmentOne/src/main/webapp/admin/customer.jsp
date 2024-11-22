<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cleaning Service Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="./css/customer.css">
</head>
<body>
    <%@ include file="../na" %>
    <div class="main-content">
       <div class="header">
            <h1>Customer Management</h1>
            <a href="#" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add New Customer
            </a>
        </div>
    	 <div class="search-bar">
            <input type="text" class="search-input" placeholder="Search customers...">
            <button class="btn btn-primary">Search</button>
        </div>
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
            <tbody>
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>john.doe@email.com</td>
                    <td>+1-555-0123</td>
                    <td><span class="role role-customer">Active</span></td>
                    <td>123 Street Name</td>
                    <td>2024-01-15</td>
                    <td class="actions">
                        <button class="icon-button btn-edit"><i class="fas fa-edit"></i></button>
                        <button class="icon-button btn-delete"><i class="fas fa-trash"></i></button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>jane.smith@email.com</td>
                    <td>+1-555-0124</td>
                    <td><span class="role role-admin">Inactive</span></td>
                    <td>123 Street Name</td>
                    <td>2024-01-14</td>
                    <td class="actions">
                        <button class="icon-button btn-edit"><i class="fas fa-edit"></i></button>
                        <button class="icon-button btn-delete"><i class="fas fa-trash"></i></button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Mike Johnson</td>
                    <td>mike.j@email.com</td>
                    <td>+1-555-0125</td>
                    <td><span class="role role-customer">Active</span></td>
                     <td>123 Street Name</td>
                    <td>2024-01-13</td>
                    <td class="actions">
                        <button class="icon-button btn-edit"><i class="fas fa-edit"></i></button>
                        <button class="icon-button btn-delete"><i class="fas fa-trash"></i></button>
                    </td>
                </tr>
              
 
            </tbody>
        </table>
        
    </div>
    <script>
        // Interactive dashboard functionality can be added here
        document.addEventListener('DOMContentLoaded', () => {
            const menuItems = document.querySelectorAll('.sidebar-menu a');
            
            menuItems.forEach(item => {
                item.addEventListener('click', (e) => {
               <div class="main-content">       menuItems.forEach(i => i.classList.remove('active'));
                    e.currentTarget.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>