let categories = [
    { id: 1, name: "Cleaning", description: "House cleaning services" },
    { id: 2, name: "Gardening", description: "Garden maintenance services" },
];

const modal = document.getElementById("categoryModal");
const modalTitle = document.getElementById("modalTitle");
const categoryForm = document.getElementById("categoryForm");
const categoryTable = document.getElementById("categoryTable");
const nameInput = document.getElementById("categoryName");
const descriptionInput = document.getElementById("categoryDescription");
const closeBtn = document.getElementById("modalCloseBtn");
let currentOperation = "create";
let currentCategoryId = null;

// Open modal
function openModal(operation, category = {}) {
    currentOperation = operation;
    modalTitle.textContent = operation === "create" ? "Add Category" : "Update Category";
    nameInput.value = category.name || "";
    descriptionInput.value = category.description || "";
    currentCategoryId = category.id || null;
    modal.style.display = "flex";
}

// Close modal
function closeModal() {
    modal.style.display = "none";
}

// Handle form submission
function handleSubmit(event) {
    event.preventDefault();
    const name = nameInput.value;
    const description = descriptionInput.value;

    if (currentOperation === "create") {
        // Add new category
        const newId = categories.length ? categories[categories.length - 1].id + 1 : 1;
        categories.push({ id: newId, name, description });
    } else if (currentOperation === "update") {
        // Update existing category
        const category = categories.find((c) => c.id === currentCategoryId);
        category.name = name;
        category.description = description;
    }

    renderCategories();
    closeModal();
}

// Delete category
function deleteCategory(id) {
    if (confirm("Are you sure you want to delete this category?")) {
        categories = categories.filter((category) => category.id !== id);
        renderCategories();
    }
}

// Render categories
function renderCategories() {
    categoryTable.innerHTML = categories
        .map(
            (category) => `
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>${category.description}</td>
            <td>
                <button class="icon-button btn-edit" onclick="openModal('update', {id: ${category.id}, name: '${category.name}', description: '${category.description}'})">
                    <i class="fas fa-edit"></i>
                </button>
                <button class="icon-button btn-delete" onclick="deleteCategory(${category.id})">
                    <i class="fas fa-trash"></i>
                </button>
            </td>
        </tr>
    `
        )
        .join("");
}

// Initialize
document.getElementById("addCategoryBtn").addEventListener("click", () => openModal("create"));
closeBtn.addEventListener("click", closeModal);
window.addEventListener("click", (event) => {
    if (event.target === modal) closeModal();
});

renderCategories();
