<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Quản lý Category</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body class="bg-light">

	<div class="container py-4">

		<h2 class="mb-4">Quản lý Category</h2>

		<!-- THÔNG BÁO -->

		<c:if test="${not empty success}">

			<div class="alert alert-success">${success}</div>

		</c:if>

		<c:if test="${not empty error}">

			<div class="alert alert-danger">${error}</div>

		</c:if>


		<!-- TÌM KIẾM -->

		<form method="get"
			action="${pageContext.request.contextPath}/admin/categories"
			class="row g-2 mb-3">

			<div class="col-md-6">

				<input type="text" name="keyword" value="${keyword}"
					class="form-control" placeholder="Tìm theo tên category...">

			</div>

			<div class="col-auto">

				<button type="submit" class="btn btn-primary">Tìm kiếm</button>

			</div>

			<div class="col-auto">

				<a href="${pageContext.request.contextPath}/admin/categories/add"
					class="btn btn-success"> + Thêm Category </a>

			</div>

			<div class="col-auto">

				<a href="${pageContext.request.contextPath}/admin/users"
					class="btn btn-secondary"> Quản lý User </a>

			</div>

		</form>


		<!-- BẢNG -->

		<table class="table table-bordered table-hover bg-white">

			<thead class="table-dark">

				<tr>

					<th>ID</th>

					<th>Tên Category</th>

					<th>Images</th>

					<th>Status</th>

					<th>Thao tác</th>

				</tr>

			</thead>

			<tbody>

				<c:forEach var="c" items="${categories}">

					<tr>

						<td>${c.categoryId}</td>

						<td>${c.categoryName}</td>

						<td>${c.images}</td>

						<td><c:choose>

								<c:when test="${c.status == 1}">
									<span class="badge bg-success"> Hoạt động </span>
								</c:when>

								<c:otherwise>
									<span class="badge bg-danger"> Khóa </span>
								</c:otherwise>

							</c:choose></td>

						<td><a
							href="${pageContext.request.contextPath}/admin/categories/edit/${c.categoryId}"
							class="btn btn-warning btn-sm"> Sửa </a> <a
							href="${pageContext.request.contextPath}/admin/categories/delete/${c.categoryId}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Bạn có chắc muốn xóa?')"> Xóa </a></td>

					</tr>

				</c:forEach>

			</tbody>

		</table>

	</div>

</body>

</html>