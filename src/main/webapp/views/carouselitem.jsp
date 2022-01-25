<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/WebMovie/js/Jquery.js"></script>
<script type="text/javascript" src="/WebMovie/js/lightslider.js"></script> -->
</head>
<body>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<div id="carousel-example-2"
				class="carousel slide carousel-fade carousel-img-style"
				data-ride="carousel">
				<!--Indicators-->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-2" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-2" data-slide-to="1"></li>
					<li data-target="#carousel-example-2" data-slide-to="2"></li>
					<li data-target="#carousel-example-2" data-slide-to="3"></li>
				</ol>
				<!--/.Indicators-->
				<!--Slides-->
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<!--Mask color-->
						<div class="view">
							<img class="d-block w-100" src="/WebMovie/images/muse.jpg"
								alt="First slide" style="object-fit: fill;">
							<div class="mask rgba-black-slight"></div>
						</div>
						<div class="carousel-caption">
							<h3 class="h3-responsive">Phim Chiếu Rạp</h3>
							<p>Bản đẹp Full-HD</p>
						</div>
					</div>
					<div class="carousel-item">
						<div class="view">
							<img class="d-block w-100" src="/Poly.Asg/images/BoGia.jpg"
								alt="Second slide" style="object-fit: fill;">
							<div class="mask rgba-black-light"></div>
						</div>
						<div class="carousel-caption">
							<h3 class="h3-responsive"></h3>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<!--Mask color-->
						<div class="view">
							<img class="d-block w-100" src="/Poly.Asg/images/endgame.jpg"
								alt="Third slide" style="object-fit: fill;">
							<div class="mask rgba-black-strong"></div>
						</div>
						<div class="carousel-caption">
							<h3 class="h3-responsive"></h3>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<!--Mask color-->
						<div class="view">
							<img class="d-block w-100"
								src="/Poly.Asg/images/mortal-kombat.jpg" alt="Fifth slide"
								style="object-fit: fill;">
							<div class="mask rgba-black-slight"></div>
						</div>
						<div class="carousel-caption">
							<h3 class="h3-responsive"></h3>
							<p></p>
						</div>
					</div>
				</div>
				<!--/.Slides-->
				<!--Controls-->
				<a class="carousel-control-prev" href="#carousel-example-2"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carousel-example-2"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<!-- Tag Phim đề cử -->
	<div class="container-fluid pt-3">
		<div class="row welcome text-center">
			<div class="col-12">
				<h1>PHIM ĐỀ CỬ</h1>
			</div>
			<hr class="line">
		</div>
	</div>
	<ul id="autoWidth" class="cs-hidden">
	<c:forEach var="item" items="${list}">
		
			<li class="item-a">
				<!-- box-slider -->
				<div class="box">
					<!-- img-box -->
					<div class="slide-img">
						<img src="/WebMovie/fileImg1/${item.getPoster()}" alt="1">
						<!-- overlayer -->
						<div class="overlay">
							<!-- buy-btn -->
							<a href="/WebMovie/page/detail/${item.getMaPhim()}" class="buy-btn">Xem Ngay</a>
						</div>
					</div>
					<!-- detail-box -->
					<div class="detail-box">
						<div class="type">
							<a href="/WebMovie/page/detail/${item.getMaPhim()}">${item.getTitle()}</a> <span>${item.getThoiLuong()}
								phút</span>
						</div>

						<a href="#" class="price">${item.getDoPhanGiai().equals('Full HD')?'FHD':item.getDoPhanGiai()}</a>
					</div>
					<!-- type -->

				</div>
			</li>
		
	</c:forEach>
	</ul>
</body>
</html>