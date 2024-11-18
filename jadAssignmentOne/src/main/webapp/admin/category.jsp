<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Service Categories</title>
    <link rel="stylesheet" href="../css/admin.css">
     <link rel="stylesheet" href="./css/modal.css">
    <link rel="stylesheet" href="./css/category.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="main-content">
        <div class="header">
            <h1>Service Categories</h1>
            <button class="btn btn-primary" id="addCategoryBtn">
                <i class="fas fa-plus"></i> Add New Category
            </button>
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

    <!-- Modal -->
    <div id="categoryModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" id="modalCloseBtn">&times;</span>
            <h2 id="modalTitle">Add Category</h2>
            <form id="categoryForm" onsubmit="handleSubmit(event)">
                <div class="form-group">
                    <label for="categoryName">Name</label>
                    <input type="text" id="categoryName" required>
                </div>
                <div class="form-group">
                    <label for="categoryDescription">Description</label>
                    <textarea id="categoryDescription" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

    <script src="./js/category.js"></script>
</body>
</html>
