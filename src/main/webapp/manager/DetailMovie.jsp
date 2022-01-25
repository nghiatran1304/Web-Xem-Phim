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
		<style type="text/css">
    <%@include file="../css/poly.css" %>
</style>
	<base href="/WebMovie/" />
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
<!-- nav-slide show -->
<link rel="stylesheet" href="../css/css.css">
<!-- nav-slide show -->

<!-- CONTENT -->
<link href="../css/css2.css" rel="stylesheet">
<!-- CONTENT -->

<!-- Contact -->
<link href="../css/style2.css" rel="stylesheet">
<!-- Contact -->

<!-- detail page -->
<link href="../css/detail.css" rel="stylesheet">
<!-- detail page -->

<!-- Rating CSS -->
<link href="../css/rating.css" rel="stylesheet">
<!-- Rating CSS -->
</head>
<body data-spy="scroll" data-target="#click1" data-offset="50"
	onload="check(false)">
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

	<div
		class="container-fluid bg-danger d-flex align-items-center justify-content-center"
		style="height: 50px;">
	 	<a href="/WebMovie/manager/editPage/index" class="btn btn-success" role="button">Trở về</a>
	</div>

	<ul class="carousel-indicators">
		<li data-target="#slide-show" data-slide-to="0" class="active"></li>
		<li data-target="#slide-show" data-slide-to="1"></li>
		<li data-target="#slide-show" data-slide-to="2"></li>
	</ul>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="#"> <img src="../image/logo.png"
			height="55">
		</a>


		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Trang
						chủ</a></li>
				<li class="navbar-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> Thể loại </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Phim hành động</a> <a
							class="dropdown-item" href="#">Khoa học - viễn tưởng</a> <a
							class="dropdown-item" href="#">Phim kinh dị</a> <a
							class="dropdown-item" href="#">Phim hoạt hình</a>
					</div></li>
				<li class="navbar-item"><a class="nav-link" href="#">Phim
						lẻ</a></li>
				<li class="navbar-item"><a class="nav-link" href="#">Phim
						bộ</a></li>

				<li class="navbar-item"><a class="nav-link" onclick="find()">Tìm
						kiếm</a> <!-- <a class="nav-link" href="#">Tìm kiếm</a> --></li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-globe-asia"></i> VietNam</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navdrop"
					data-toggle="dropdown"> <i class="fas fa-sign-in-alt"></i> Đăng
						nhập / Đăng ký
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Đăng nhập</a>
						<hr>
						<a class="dropdown-item" href="#">Đăng ký</a>
					</div></li>

			</ul>


		</div>
	</nav>
	<!-- Thẻ Nav -->

	<!-- Tab Search -->
	<div class="container-fluid bg-primary" id="find"
		style="display: none;">
		<div class="row">
			<div class="col-sm-12 pt-3">
				<div class="container">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Tìm kiếm...">
						<div class="input-group-append">
							<span class="input-group-text"><i class="fas fa-search"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tag Search -->

	<!-- Tag Slide-show -->
	<div id="slide-show" class="carousel slide" data-ride="carousel">

		<ul class="carousel-indicators">
			<li data-target="#slide-show" data-slide-to="0" class="active"></li>
			<li data-target="#slide-show" data-slide-to="1"></li>
			<li data-target="#slide-show" data-slide-to="2"></li>
		</ul>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../img game/1.jpg" height="100%" width="100%">
				<div class="carousel-caption">
					<h1 class="display-2">ASSASSIN'S CREED 2</h1>
					<h3>Phim chiếu rạp bản đẹp</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Xem
						Phim</button>
				</div>
			</div>
			<div class="carousel-item">
				<img src="../img game/2.jpg" height="100%" width="100%">
				<div class="carousel-caption">
					<h1 class="display-2">DISHONORED</h1>
					<h3>Phim chiếu rạp bản đẹp</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Xem
						Phim</button>
				</div>
			</div>
			<div class="carousel-item">
				<img src="../img game/3.jpg" height="100%" width="100%">
				<div class="carousel-caption">
					<h1 class="display-2">TOM RAIDER</h1>
					<h3>Phim chiếu rạp bản đẹp</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Xem
						Phim</button>
				</div>
			</div>
		</div>

		<a class="carousel-control-prev" href="#slide-show" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slide-show" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

	<!-- Tag đường dẫn -->
	<div class="container pt-5">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="#">Phim hành động</a></li>
			<li class="breadcrumb-item"><a href="#">${phim.getTitle()}</a></li>
		</ul>
	</div>
	<!-- Tag đường dẫn -->

	<!-- Tag Content -->
	
	<!-- Tag Content -->

	<!-- Tag Information Film -->
	<h1 id="click2" class="text-center">REVIEW PHIM</h1>
	<hr class="line">
	<div class="container card container-4 ">
		<span> ${phim.getNoiDung()} </span>
	</div>
	<!-- Tag Information Film -->


	<!-- Tag Trailer phim -->
	<h1 id="" class="text-center pt-5">TRAILER</h1>
	<hr class="line">
	<div class="container card">
		<iframe width="100%" height="500"
			src="https://www.youtube.com/embed/${phim.getTrailer()}"
			frameborder=""
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	</div>
	<!-- Tag Trailer phim -->

	<!-- Tag đánh giá -->
	<h1 class="text-center pt-5">ĐÁNH GIÁ</h1>
	<hr class="line">
	<div
		class="container card bg-dark d-flex flex-wrap align-content-center">
		<div class="container-5">
			<div class="post-1">
				<div class="text-1">Thanks for rating us!</div>
				<div class="edit-1" onclick="check(true)">EDIT</div>
			</div>
			<div class="star-widget">
				<input type="radio" name="rate" id="rate-5"> <label
					for="rate-5" class="fas fa-star"></label> <input type="radio"
					name="rate" id="rate-4"> <label for="rate-4"
					class="fas fa-star"></label> <input type="radio" name="rate"
					id="rate-3"> <label for="rate-3" class="fas fa-star"></label>
				<input type="radio" name="rate" id="rate-2"> <label
					for="rate-2" class="fas fa-star"></label> <input type="radio"
					name="rate" id="rate-1"> <label for="rate-1"
					class="fas fa-star"></label>
				<form action="#" class="form-1">
					<header></header>
					<div class="textarea">
						<textarea cols="30" placeholder="Describe your experience.."></textarea>
					</div>
					<div class="btn-1">
						<button class="click" onclick="check(false)" type="submit">Post</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Tag đánh giá -->

	<!-- Tag Phim chiếu rạp -->
	<div class="container container-2">
		<h1 class="text-center">CÙNG THỂ LOẠI</h1>
		<hr class="line">
		<div class="row">
			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img src="../images/Frozen.jpg" class="w-100">
						<div class="overlay2">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						title="Frozen">Frozen</a>
				</h5>
				<h5 class="text-center">Thời lượng: 120 phút</h5>
				<a href="#" class="btn buy">Xem phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img src="../images/V For Vendetta.jpg"
						class="w-100">
						<div class="overlay2">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						title="V For Vendetta">V For Vendetta</a>
				</h5>
				<h5 class="text-center">Thời lượng: 90 phút</h5>
				<a href="#" class="btn buy">Xem phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img
						src="../images/Star Wars Episode VII-The Force Awakens.jpg"
						class="w-100">
						<div class="overlay2">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						title="Star Wars Episode VII: The Force Awakens">Star Wars
						Episode VII: The Force...</a>
				</h5>
				<h5 class="text-center">Thời lượng: 154 phút</h5>
				<a href="#" class="btn buy">Xem phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img src="../images/Transformers(2007).jpg"
						class="w-100">
						<div class="overlay2">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						title="Transformers(2007)">Transformers(2007)</a>
				</h5>
				<h5 class="text-center">Thời lượng: 160 phút</h5>
				<a href="#" class="btn buy">Xem phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img src="../images/Captain America-Civil War.jpg"
						class="w-100">
						<div class="overlay2">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						title="Captain America: Civil War">Captain America: Civil War</a>
				</h5>
				<h5 class="text-center">Thời lượng: 180 phút</h5>
				<a href="#" class="btn buy">Xem phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img src="../images/Iron man(2008).jpg"
						class="w-100">
						<div class="overlay2">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						title="Iron man(2008)">Iron man(2008)</a>
				</h5>
				<h5 class="text-center">Thời lượng: 190 phút</h5>
				<a href="#" class="btn buy">Xem phim</a>
			</div>
		</div>
	</div>
	<!-- Tag Phim chiếu rạp -->

	<!-- Tag Comment  -->
	<h1 class="text-center pt-5">BÌNH LUẬN</h1>
	<hr class="line">
	<div class="container card">
		<ul class="list-unstyled">
			<li class="media"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min1.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Anna Smith</h5>
					<!--Review-->
					<i class="fas fa-star blue-text checked"> </i> <i
						class="fas fa-star blue-text checked"> </i> <i
						class="fas fa-star blue-text checked"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i>
					<p>Tuyệt vời!</p>
				</div></li>
			<li class="media my-4"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min2.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Tom Brown</h5>
					<!--Review-->
					<i class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star grey-text"> </i>
					<p>Trang web cần khắc phục nhiều.</p>
				</div></li>
			<li class="media"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min3.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Natalie Doe</h5>
					<!--Review-->
					<i class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star grey-text"> </i> <i
						class="fas fa-star grey-text"> </i>
					<p>Xem phim bị giật lab quá nhiều.</p>
				</div></li>
			<li class="media"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min3.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Natalie Doe</h5>
					<!--Review-->
					<i class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star blue-text"> </i> <i
						class="fas fa-star grey-text"> </i> <i
						class="fas fa-star grey-text"> </i>
					<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
				</div></li>
		</ul>

		<!-- Tag pagination -->
		<ul class="pagination justify-content-center" id="page">
			<li class="page-item disabled"><a id="prev" class="page-link"
				href="#"><i class="fas fa-angle-double-left"></i></a></li>
			<li class="page-item"><a id="next" class="page-link" href="#"><i
					class="fas fa-angle-double-right"></i></a></li>
		</ul>
		<!-- Tag pagination -->
	</div>

	<div class="pt-5"></div>
	<!-- Tag Comment  -->


	<!-- Tag Liên hệ -->
	<div class="contact-section">

		<h1>Contact Us</h1>
		<div class="border"></div>
		<form class="contact-form" action="index.html" method="post">
			<input type="text" class="contact-form-text" placeholder="Your name">
			<input type="email" class="contact-form-text"
				placeholder="Your email"> <input type="text"
				class="contact-form-text" placeholder="Your phone">
			<textarea class="contact-form-text" placeholder="Your message"></textarea>
			<input type="submit" class="contact-form-btn" value="Send">
		</form>
	</div>
	<!-- Tag Liên hệ -->

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

	<!-- Tag To top -->
	<a href="#" class="to-top"> <i class="fas fa-chevron-up"></i>
	</a>
	<!-- Tag To top -->


	<!-- Link Javascript -->
	<script type="text/javascript" src="../js/javascript.js"></script>
	<script type="text/javascript" src="../js/detail.js"></script>
	<script type="text/javascript" src="../js/rating.js"></script>
	<!-- <script type="text/javascript" src="js/script.js"></script> -->
	<!-- Link Javascript -->
</body>
</html>