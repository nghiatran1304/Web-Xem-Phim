<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detail Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
	
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/675bbfe78c.js" crossorigin="anonymous"></script>
<!-- nav-slide show -->
<style type="text/css">
<%@
include file="../css/css.css"%>
</style>
<!-- nav-slide show -->
<!-- Contact -->
<style type="text/css">
<%@ include file="../css/style2.css"%>
</style>
<!-- Contact -->
<!-- Profile CSS -->
<style type="text/css">
<%@ include file="../css/profile.css"%>
</style>
<!-- Profile CSS -->
<style type="text/css">
<%@
include file="../css/poly.css" %>
</style>
</head>
<body>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@include file="nav.jsp"%>

	<!-- Tab Search -->
	<jsp:include page="search.jsp"></jsp:include>
	<!-- Tag Search -->

	<!-- Tag đường dẫn -->
	<jsp:include page="path.jsp"></jsp:include>
	<!-- Tag đường dẫn -->

	<c:if test="${!empty check}">
		<div class="container pt-4" style="display: block">
			<div class="alert alert-${backround} alert-dismissible fade show text-center">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong style="color: red;">Thông báo!</strong> ${message}
			</div>
		</div>
	</c:if>


 	<form action="/ProfileServlet" method="post" enctype="multipart/form-data">
<!-- 	<form action="/page/profile/index" method="post" enctype="multipart/form-data"> -->
		<div class="container rounded bg-white mt-5 mb-5">
			<div class="row">
				<div class="col-md-3 border-right">
					<div class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img class="rounded-circle mt-5" src="/WebMovie/img/user.png" width="90">
						<span class="font-weight-bold">${profile.getTenDN()}</span><span class="text-black-50">${profile.getEmail()}</span>
					</div>
				</div>
				<div class="col-md-5 border-right">
					<div class="p-3 py-5">
						<div class="d-flex justify-content-between align-items-center mb-3">
							<h6 class="text-right">Cập nhật thông tin</h6>
						</div>
						<div class="row mt-2">
							<div class="col-md-6">
								<label class="labels">Họ</label>
								<input type="text" name="Ho" class="form-control" value="${profile.getHo()}" required="required">
							</div>
							<div class="col-md-6">
								<label class="labels">Tên</label>
								<input type="text" name="Ten" class="form-control" value="${profile.getTen()}" required="required">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">Email</label>
								<input type="email" class="form-control" name="Email" value="${profile.getEmail()}" required="required">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-6">
								<label class="labels">Mật khẩu</label>
								<input type="password" name="matKhau" class="form-control" value="${profile.getMatKhau()}" required="required">
							</div>
							<div class="col-md-6">
								<label class="labels">Xác nhận mật khẩu</label>
								<input type="password" name="xnMatKhau" class="form-control" value="${profile.getMatKhau()}" required="required">
							</div>
						</div>
						<div class="mt-5 text-center">
							<button class="btn btn-primary profile-button" formaction="index">Cập nhật</button>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="p-3 py-5">
						<div class="d-flex justify-content-between align-items-center experience">
							<span>Hoạt động</span>
						</div>
						<div class="d-flex flex-row mt-3 exp-container">
							<img src="/WebMovie/image/heart.png" width="45" height="45" height="45">
							<div class="work-experience ml-1">
								<span class="font-weight-bold d-block">Yêu thích:</span><span class="d-block text-black-70 labels" style="font-size: medium;">${favorite}</span>
							</div>
						</div>
						<hr>
						<div class="d-flex flex-row mt-3 exp-container">
							<img src="/WebMovie/image/speech-bubble.png" width="45" height="45">
							<div class="work-experience ml-1">
								<span class="font-weight-bold d-block">Bình luận:</span><span class="d-block text-black-70 labels" style="font-size: medium;">${comment}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<footer class="row bg-secondary mt-5 dk-footer" id="dk-footer">
		<div class="container">
			<div class="row container-fluid">
				<div class="col-md-12 col-lg-4">
					<div class="container-fluid dk-footer-box-info mb-4">
						<a href="#" class="footer-logo">
							<img src="/Poly.Asg/images/logo_1.png" alt="footer_logo" width="150" height="150" class="img-fluid ml-5">
						</a>
						<h4 class="footer-info-text text-light text-center">Tập đoàn GodEdoc hân hạnh tài trợ</h4>
						<div class="footer-social-link mb-2">
							<h3>Follow us</h3>
							<ul>
								<li><a href="#">
										<i class="fab fa-facebook-f bg-primary"></i>
									</a></li>
								<li><a href="#">
										<i class="fab fa-twitter"></i>
									</a></li>
								<li><a href="#">
										<i class="fab fa-google-plus-g text-danger bg-light"></i>
									</a></li>
								<li><a href="#">
										<i class="fab fa-linkedin-in bg-primary"></i>
									</a></li>
								<li><a href="#">
										<i class="fab fa-instagram"></i>
									</a></li>
							</ul>
						</div>
						<small class="text-light">Copyright ©2021, All Right Reserved</small>
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
								<p>Đừng bỏ lở thông báo những bộ phim mới nhất của chúng tôi. Điền Email để nhận thông báo mới nhất</p>
								<form action="#">
									<div class="form-row">
										<div class="col dk-footer-form">
											<input type="email" class="form-control" placeholder="Email Address">
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

	<!-- Tag To top -->
	<a href="#" class="to-top">
		<i class="fas fa-chevron-up"></i>
	</a>
	<!-- Tag To top -->


	<!-- Link Javascript -->
	<script type="text/javascript" src="/WebMovie/js/javascript.js"></script>
	<script type="text/javascript" src="/WebMovie/js/detail.js"></script>
	<script type="text/javascript" src="/WebMovie/js/profile.js"></script>
	<!-- <script type="text/javascript" src="js/script.js"></script> -->
	<!-- Link Javascript -->

</body>
</html>