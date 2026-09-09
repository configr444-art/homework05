<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="vi">

<head>
<meta charset="UTF-8">
<title><c:choose>
		<c:when test="${empty user.userId}">
                Thêm User
            </c:when>
		<c:otherwise>
                Sửa User
            </c:otherwise>
	</c:choose></title>

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

						<c:when test="${empty user.userId}">
                    Thêm User
                </c:when>

						<c:otherwise>
                    Sửa User
                </c:otherwise>

					</c:choose>
				</h4>
			</div>

			<div class="card-body">

				<form method="post"
					action="${pageContext.request.contextPath}/admin/users/save">

					<!-- ID -->
					<input type="hidden" name="userId" value="${user.userId}">

					<!-- USERNAME -->
					<div class="mb-3">

						<label class="form-label"> Username </label> <input type="text"
							name="username" value="${user.username}" class="form-control"
							required>

					</div>

					<!-- PASSWORD -->
					<div class="mb-3">

						<label class="form-label"> Password </label> <input
							type="password" name="password" value="${user.password}"
							class="form-control" required>

					</div>

					<!-- FULL NAME -->
					<div class="mb-3">

						<label class="form-label"> Họ và tên </label> <input type="text"
							name="fullName" value="${user.fullName}" class="form-control">

					</div>

					<!-- EMAIL -->
					<div class="mb-3">

						<label class="form-label"> Email </label> <input type="email"
							name="email" value="${user.email}" class="form-control">

					</div>

					<!-- PHONE -->
					<div class="mb-3">

						<label class="form-label"> Số điện thoại </label> <input
							type="text" name="phone" value="${user.phone}"
							class="form-control">

					</div>

					<!-- AVATAR -->
					<div class="mb-3">

						<label class="form-label"> Avatar </label> <input type="text"
							name="avatar" value="${user.avatar}" class="form-control">

					</div>

					<!-- ROLE -->
					<div class="mb-3">

						<label class="form-label"> Quyền </label> <select name="roleId"
							class="form-select">

							<option value="1" ${user.roleId == 1 ? 'selected' : ''}>
								Admin</option>

							<option value="2" ${user.roleId == 2 ? 'selected' : ''}>
								User</option>

						</select>

					</div>

					<!-- STATUS -->
					<div class="mb-3">

						<label class="form-label"> Trạng thái </label> <select
							name="status" class="form-select">

							<option value="1" ${user.status == 1 ? 'selected' : ''}>
								Hoạt động</option>

							<option value="0" ${user.status == 0 ? 'selected' : ''}>
								Khóa</option>

						</select>

					</div>

					<!-- BUTTON -->
					<button type="submit" class="btn btn-primary">Lưu</button>

					<a href="${pageContext.request.contextPath}/admin/users"
						class="btn btn-secondary"> Quay lại </a>

				</form>

			</div>

		</div>

	</div>

</body>
</html>
