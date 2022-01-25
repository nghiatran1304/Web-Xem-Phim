<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/675bbfe78c.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<style type="text/css">
    <%@include file="../css/poly.css" %>
</style>
	<base href="/WebMovie/" />
    <style type="text/css">
       <%@include file="../css/delete.css" %>
    </style>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<c:url var="urlTL" value="/manager/editTL" />

	<!-- Tag nav -->
	<%@include file="nav.jsp"%>
	<!-- Thẻ Nav -->

	<c:if test="${!empty requestScope.show}">
		<div class="container pt-4" style="display: block">
			<div
				class="alert alert-${backround} alert-dismissible fade show text-center">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong style="color: red;">Thông báo!</strong> ${message}
			</div>
		</div>
	</c:if>

    <div class="pt-4"></div>
    
	<div class="container border pt-3">
		<h1 class="text-center">FORM THỂ LOẠI</h1>
		<form action="${urlTL}/index" method="post">
			<div class="form-group">
				<label>Mã thể loại:</label> <input type="text" class="form-control"
					name="maTheLoai" value="${tl.getMaTheLoai()}" ${disMaTL?'readonly':''}>
			</div>
			<div class="form-group">
				<label>Tên thể loại</label> <input type="text" class="form-control"
					name="tenTheLoai" value="${tl.getTenTheLoai()}">
			</div>
			<div class="text-center">
				<c:choose>
					<c:when test="${!empty edit}">
						<button formaction="${urlTL}/update/${phim.getMaPhim()}"
							class="btn btn-primary">Lưu</button>
					</c:when>
					<c:otherwise>
						<button formaction="${urlTL}/create" class="btn btn-primary">Lưu</button>
					</c:otherwise>
				</c:choose>
				<button class="btn btn-info" formaction="${urlTL}/index">Mới</button>
			</div>



			<h2 class="pt-4 text-center">Danh sách</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Mã thể loại</th>
						<th>Tên thể loại</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.getMaTheLoai()}</td>
							<td>${item.getTenTheLoai()}</td>
							<td><button class="btn btn-primary btn-sm"
									formaction="${urlTL}/fillEdit/${item.getMaTheLoai()}">Sửa</button>
								| <a class="btn btn-danger btn-sm" href="#myModal"
								data-toggle="modal" onclick="result('${item.getMaTheLoai()}')">Xóa</a>
						</tr>
					</c:forEach>

				</tbody>
			</table>
	


	<div class="container pt-5 text-center pb-5">
		<ul class="pagination justify-content-center">
			<li class="page-item ${disBack?'disabled':''}"><button
					class="page-link" formaction="${urlTL}/back">
					<i class="fas fa-angle-double-left"></i>
				</button></li>
			<li class="page-item disabled"><a class="page-link">${page}</a></li>
			<li class="page-item ${disNext?'disabled':''}"><button
					class="page-link" formaction="${urlTL}/next">
					<i class="fas fa-angle-double-right"></i>
				</button></li>
		</ul>
		<label style="font-size: 15px;">Trang: <input type="number"
			max="${maxPage}" min="1" style="width: 30px;" value="${page}">/${maxPage}
		</label>
	</div>


	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header flex-column">
					<div class="icon-box">
						<i class="material-icons">&#xE5CD;</i>
					</div>
					<h4 class="modal-title w-100">Bạn có chắc</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Mọi thông tin liên quan đến thể loại phim này sẽ bị mất! Bạn
						thực sự muốn xóa?</p>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Thoát</button>
					<button formaction="${urlTL}/deleteTL" name="path"
						class="btn btn-danger">Xóa</button>
					<input type="text" name="maXoa" id="result" style="display: none;">
				</div>
			</div>
		</div>
	</div>
	</form>
	</div>


	<!-- Tag Footer -->
	<footer class="row bg-secondary mt-5 dk-footer" id="dk-footer">
			<div class="container">
				<div class="row container-fluid">
					<div class="col-md-12 col-lg-4">
						<div class="container-fluid dk-footer-box-info mb-4">
							<a href="#" class="footer-logo"> <img
								src="/Poly.Asg/images/logo_1.png" alt="footer_logo" width="150"
								height="150" class="img-fluid ml-5">
							</a>
							<h4 class="footer-info-text text-light text-center">Tập đoàn
								GodEdoc hân hạnh tài trợ</h4>
							<div class="footer-social-link mb-2">
								<h3>Follow us</h3>
								<ul>
									<li><a href="#"> <i
											class="fab fa-facebook-f bg-primary"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-twitter"></i>
									</a></li>
									<li><a href="#"> <i
											class="fab fa-google-plus-g text-danger bg-light"></i>
									</a></li>
									<li><a href="#"> <i
											class="fab fa-linkedin-in bg-primary"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-instagram"></i>
									</a></li>
								</ul>
							</div>
							<small class="text-light">Copyright ©2021, All Right
								Reserved</small>
						</div>

					</div>
					<!-- End Col -->
					<div class="col-md-12 col-lg-8">
						<div class="row">
							<div class="col-md-6">
								<div class="contact-us">
									<div class="contact-icon">
										<i class="fas fa-map-marked-alt text-light" aria-hidden="true"></i>
									</div>
									<!-- End contact Icon -->
									<div class="contact-info">
										<h3>Việt Nam</h3>
										<p>Thành phố Hồ Chí Minh</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="contact-us contact-us-last">
									<div class="contact-icon">
										<i class="fas fa-phone-square text-light" aria-hidden="true"></i>
									</div>
									<!-- End contact Icon -->
									<div class="contact-info">
										<h3>0366 888 470</h3>
										<p>Liên hệ với chúng tôi</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-lg-6">
								<div class="footer-widget footer-left-widget">
									<div class="section-heading">
										<h3>Useful Links</h3>
										<span class="animate-border border-black"></span>
									</div>
									<ul class="text-light">
										<li><a href="#">About us</a></li>
										<li><a href="#">Services</a></li>
										<li><a href="#">Projects</a></li>
										<li><a href="#">Our Team</a></li>
									</ul>
									<ul class="text-light">
										<li><a href="#">Contact us</a></li>
										<li><a href="#">Blog</a></li>
										<li><a href="#">Testimonials</a></li>
										<li><a href="#">Faq</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-12 col-lg-6">
								<div class="footer-widget">
									<div class="section-heading">
										<h3>Subscribe</h3>
										<span class="animate-border border-black"></span>
									</div>
									<p>Đừng bỏ lở thông báo những bộ phim mới nhất của chúng
										tôi. Điền Email để nhận thông báo mới nhất</p>
									<form action="#">
										<div class="form-row">
											<div class="col dk-footer-form">
												<input type="email" class="form-control"
													placeholder="Email Address">
												<button type="submit">
													<i class="far fa-paper-plane"></i>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	<!-- Tag Footer -->


	<!-- Link Javascript -->
	<script type="text/javascript" src="../js/javascript.js"></script>
	<script type="text/javascript" src="../js/script.js"></script>
	<script src="js/managerPhim.js" type="../text/javascript"></script>
	<script>
		function result(u) {
			var temp = document.getElementById("result");
			temp.value = u;
			//salert(temp);
		}
	</script>
	<!-- Link Javascript -->

</body>
</html>