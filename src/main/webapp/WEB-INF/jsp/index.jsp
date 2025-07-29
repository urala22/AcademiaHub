<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>License Allocation Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa; /* Soft light gray */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border-radius: 10px;
            border: 1px solid #dee2e6;
        }
        .card-title {
            color: #495057;
            font-weight: 600;
        }
        .btn-custom {
            font-size: 1rem;
            padding: 10px;
            border-radius: 8px;
        }
        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        .btn-success {
            background-color: #198754;
            border-color: #198754;
        }
        .header-title {
            color: #343a40;
            font-weight: 700;
        }
        .lead {
            color: #6c757d;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card shadow-sm p-4">
                <div class="text-center">
                    <h1 class="mb-3 header-title">License Allocation System</h1>
                    <p class="lead">Manage Udemy licenses efficiently</p>
                </div>

                <!-- Success Message -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success text-center" role="alert">
                        ${successMessage}
                    </div>
                </c:if>

                <div class="d-grid gap-3 mt-4">
                    <a href="/list" class="btn btn-primary btn-custom">View All Licenses</a>
                    <a href="/addLicense" class="btn btn-success btn-custom">Allocate License</a>
                </div>

                <div class="text-center mt-4">
                    <small class="text-muted">&copy; 2025 License Management</small>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

