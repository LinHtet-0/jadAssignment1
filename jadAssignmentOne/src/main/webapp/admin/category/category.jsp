<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Service Categories</title>
    <link rel="stylesheet" href="../admin.css">
     <link rel="stylesheet" href="../css/modal.css">
    <link rel="stylesheet" href="./category.css">
</head>
<body>
    <%@ include file="../navbar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Service Categories</h1>
            <a class="btn btn-primary" id="addCategoryBtn" href="addCategory.jsp">
                <i class="fas fa-plus"></i> Add New Category
            </a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="categoryTable">
                <tr>
                    <td>1</td>
                    <td>Cleaning</td>
                    <td>House cleaning services</td>
                    <td>
                        <button class="icon-button btn-edit" onclick="openModal('update', {id: 1, name: 'Cleaning', description: 'House cleaning services'})">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="icon-button btn-delete" onclick="deleteCategory(1)">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
                <!-- Other rows will be added dynamically -->
            </tbody>
        </table>
    </div>

 
  
      
</body>
</html>
