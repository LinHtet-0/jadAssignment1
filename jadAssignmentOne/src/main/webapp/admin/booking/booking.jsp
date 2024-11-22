<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cleaning Service Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../admin.css">
</head>
<body>
    <%@ include file="../navbar.jsp" %>
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