<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Category</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body class="bg-light">

	<div class="container py-4">

		<div class="card">

			<div class="card-header">

				<h4>

					<c:choose>

						<c:when test="${empty category.categoryId}">

                        Thêm Category

                    </c:when>

						<c:otherwise>

                        Sửa Category

                    </c:otherwise>

					</c:choose>

				</h4>

			</div>


			<div class="card-body">

				<form method="post"
					action="${pageContext.request.contextPath}/admin/categories/save">

					<input type="hidden" name="categoryId"
						value="${category.categoryId}">


					<div class="mb-3">

						<label class="form-label"> Tên Category </label> <input
							type="text" name="categoryName" value="${category.categoryName}"
							class="form-control" required>

					</div>


					<div class="mb-3">

						<label class="form-label"> Images </label> <input type="text"
							name="images" value="${category.images}" class="form-control">

					</div>


					<div class="mb-3">

						<label class="form-label"> Status </label> <select name="status"
							class="form-select">

							<option value="1" ${category.status == 1 ? 'selected' : ''}>

								Hoạt động</option>

							<option value="0" ${category.status == 0 ? 'selected' : ''}>

								Khóa</option>

						</select>

					</div>


					<button type="submit" class="btn btn-primary">Lưu</button>

					<a href="${pageContext.request.contextPath}/admin/categories"
						class="btn btn-secondary"> Quay lại </a>

				</form>

			</div>

		</div>

	</div>

</body>

</html>