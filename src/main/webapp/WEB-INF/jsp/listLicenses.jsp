<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>License List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">All Licenses</h2>

    <c:if test="${empty licenses}">
        <div class="alert alert-warning text-center">No licenses available!</div>
    </c:if>

    <c:if test="${not empty licenses}">
        <table class="table table-hover table-bordered shadow">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>License Key</th>
                    <th>Status</th>
                    <th>Assigned To</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="license" items="${licenses}">
                    <tr class="<c:choose>
                                <c:when test='${license.status == "AVAILABLE"}'>table-success</c:when>
                                <c:when test='${license.status == "ASSIGNED"}'>table-warning</c:when>
                                <c:otherwise>table-danger</c:otherwise>
                              </c:choose>">
                        <td>${license.id}</td>
                        <td>${license.licenseKey}</td>
                        <td>${license.status}</td>
                        <td>
                            <c:choose>
                                <c:when test="${license.status == 'AVAILABLE' || license.status == 'EXPIRED'}">NULL</c:when>
                                <c:otherwise>${license.assignedTo}</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${license.status == 'AVAILABLE'}">0000-00-00 00:00:00</c:when>
                                <c:otherwise>${license.startDate != null ? license.startDate : "—"}</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${license.status == 'AVAILABLE'}">0000-00-00 00:00:00</c:when>
                                <c:otherwise>${license.endDate != null ? license.endDate : "—"}</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="text-center mt-4">
        <a href="/" class="btn btn-primary">Back to Home</a>
        <a href="/addLicense" class="btn btn-success">Allocate License</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
