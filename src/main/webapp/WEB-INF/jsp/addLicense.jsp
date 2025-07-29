<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Allocate License</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function updateFormAction() {
            var selectedId = document.getElementById("licenseDropdown").value;
            document.getElementById("allocateForm").action = "/allocate/" + selectedId;
        }
    </script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Allocate a License</h2>

    <!-- Error or Success Messages -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger text-center" role="alert">
            ${errorMessage}
        </div>
    </c:if>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success text-center" role="alert">
            ${successMessage}
        </div>
    </c:if>

    <div class="card shadow p-4">
        <form id="allocateForm" method="post" onsubmit="updateFormAction()">
            <div class="mb-3">
                <label for="licenseDropdown" class="form-label">Choose License</label>
                <select class="form-select" id="licenseDropdown" name="licenseId" required>
                    <c:forEach var="license" items="${licenses}">
                        <c:if test="${license.status == 'AVAILABLE' || license.status == 'EXPIRED'}">
                            <option value="${license.id}">
                                ${license.licenseKey} (${license.status})
                            </option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="user" class="form-label">User</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Enter user name" required>
            </div>

            <div class="mb-3">
                <label for="days" class="form-label">Number of Days</label>
                <input type="number" class="form-control" id="days" name="days" min="1" placeholder="Enter number of days" required>
            </div>

            <button type="submit" class="btn btn-success w-100">Allocate License</button>
            <a href="/" class="btn btn-secondary w-100 mt-2">Cancel</a>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

