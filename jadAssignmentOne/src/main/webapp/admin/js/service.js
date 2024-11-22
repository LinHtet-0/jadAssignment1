let services = [
    { service_id: 1, category_id: 1, service_name: "Cleaning", description: "Standard cleaning service", price: 50, image_path: "path/to/image1.jpg" },
    { service_id: 2, category_id: 2, service_name: "Deep Cleaning", description: "Thorough cleaning service", price: 100, image_path: "path/to/image2.jpg" }
];

function renderServices() {
    const tbody = document.getElementById("serviceTable");
    tbody.innerHTML = "";
    services.forEach(service => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>${service.service_id}</td>
            <td>${service.category_id}</td>
            <td>${service.service_name}</td>
            <td>${service.description}</td>
            <td>$${service.price}</td>
            <td>${service.image_path}</td>
            <td class="actions">
                <button class="btn-edit" onclick="editService(${service.service_id})"><i class="fas fa-edit"></i></button>
                <button class="btn-delete" onclick="deleteService(${service.service_id})"><i class="fas fa-trash"></i></button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

function openModal(serviceId = null) {
    const modal = document.getElementById("serviceModal");
    const form = document.getElementById("serviceForm");
    form.reset();

    if (serviceId) {
        const service = services.find(s => s.service_id === serviceId);
        form.category_id.value = service.category_id;
        form.service_name.value = service.service_name;
        form.description.value = service.description;
        form.price.value = service.price;
        form.image_path.value = service.image_path;
        form.dataset.serviceId = serviceId;
    } else {
        delete form.dataset.serviceId;
    }

    modal.classList.add("active");
}

function closeModal() {
    document.getElementById("serviceModal").classList.remove("active");
}

function handleSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const serviceId = form.dataset.serviceId;

    const newService = {
        category_id: parseInt(form.category_id.value),
        service_name: form.service_name.value,
        description: form.description.value,
        price: parseFloat(form.price.value),
        image_path: form.image_path.value
    };

    if (serviceId) {
        const index = services.findIndex(s => s.service_id === parseInt(serviceId));
        services[index] = { ...services[index], ...newService };
    } else {
        newService.service_id = services.length ? Math.max(...services.map(s => s.service_id)) + 1 : 1;
        services.push(newService);
    }

    renderServices();
    closeModal();
}

function deleteService(serviceId) {
    if (confirm("Are you sure you want to delete this service?")) {
        services = services.filter(s => s.service_id !== serviceId);
        renderServices();
    }
}

function editService(serviceId) {
    openModal(serviceId);
}

document.addEventListener("DOMContentLoaded", renderServices);
