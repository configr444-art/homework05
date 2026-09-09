<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<title>Quản lý User</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-light">

	<div class="container py-4">

		<h2 class="mb-4">Quản lý User</h2>

		<!-- THÔNG BÁO -->
		<c:if test="${not empty success}">
			<div class="alert alert-success">${success}</div>
		</c:if>

		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>

		<!-- TÌM KIẾM -->
		<form method="get"
			action="${pageContext.request.contextPath}/admin/users"
			class="row g-2 mb-3">

			<div class="col-md-6">
				<input type="text" name="keyword" value="${keyword}"
					class="form-control"
					placeholder="Tìm username, họ tên hoặc email...">
			</div>

			<div class="col-auto">
				<button type="submit" class="btn btn-primary">Tìm kiếm</button>
			</div>

			<div class="col-auto">
				<a href="${pageContext.request.contextPath}/admin/users/add"
					class="btn btn-success"> + Thêm User </a>
			</div>

			<div class="col-auto">
				<a href="${pageContext.request.contextPath}/admin/categories"
					class="btn btn-secondary"> Quản lý Category </a>
			</div>

		</form>

		<!-- DANH SÁCH USER -->
		<table class="table table-bordered table-hover bg-white">

			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>Full Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Role</th>
					<th>Status</th>
					<th>Thao tác</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach var="u" items="${users}">

					<tr>

						<td>${u.userId}</td>

						<td>${u.username}</td>

						<td>${u.fullName}</td>

						<td>${u.email}</td>

						<td>${u.phone}</td>

						<td><c:choose>

								<c:when test="${u.roleId == 1}">
									<span class="badge bg-danger"> Admin </span>
								</c:when>

								<c:otherwise>
									<span class="badge bg-primary"> User </span>
								</c:otherwise>

							</c:choose></td>

						<td><c:choose>

								<c:when test="${u.status == 1}">
									<span class="badge bg-success"> Hoạt động </span>
								</c:when>

								<c:otherwise>
									<span class="badge bg-danger"> Khóa </span>
								</c:otherwise>

							</c:choose></td>

						<td><a
							href="${pageContext.request.contextPath}/admin/users/edit/${u.userId}"
							class="btn btn-warning btn-sm"> Sửa </a> <a
							href="${pageContext.request.contextPath}/admin/users/delete/${u.userId}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Bạn có chắc muốn xóa user này?')">
								Xóa </a></td>

					</tr>

				</c:forEach>

			</tbody>

		</table>

	</div>

</body>
</html>