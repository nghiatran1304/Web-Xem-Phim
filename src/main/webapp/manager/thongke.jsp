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
</head>
<body>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<c:url var="u" value="/manager"></c:url>

	<!-- Tag nav -->
	<%@include file="nav.jsp" %>
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

	<div class="pb-2"></div>

	<div class="container border pt-3">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item"><a class="nav-link active"
		id="videoEditing-tab" data-toggle="tab" href="#videoEditing"
		role="tab" aria-controls="videoEditing" aria-selected="true">Favorites</a>
	</li>
	<li class="nav-item"><a class="nav-link" id="videoList-tab"
		data-toggle="tab" href="#videoList" role="tab"
		aria-controls="videoList" aria-selected="false">Favorite Users</a></li>
	<li class="nav-item"><a class="nav-link" id="shareFriends-tab"
		data-toggle="tab" href="#shareFriends" role="tab"
		aria-controls="shareFriends" aria-selected="false">Share Friends</a></li>
</ul>
<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active p-5" id="videoEditing"
		role="tabpanel" aria-labelledby="videoEditing-tab">
		<form action="VideoByYearServlet" method="post" class="form-inline mt-3 mb-3">
			<div class="form-group mx-sm-3 mb-2">
				<input type="number" min='2000' name="year" placeholder="Input year"
					class="form-control" />
				<button class="btn btn-success ml-3">Confirm</button>
			</div>
		</form>
		<table class="table table-bordered mt-3">
			<thead>
				<tr class="text-center bg-info text-white">
					<th scope="col" class="text-uppercase">Video Title</th>
					<th scope="col" class="text-uppercase">Favorite Count</th>
					<th scope="col" class="text-uppercase">Newest Date</th>
					<th scope="col" class="text-uppercase">Oldest Date</th>
				</tr>
			</thead>
			<tbody>
				<%-- 				<c:forEach var="item" items="${favList}">
					<tr>
						<td>${item.videoTitle}</td>
						<td>${item.favoriteCount}</td>
						<td>${item.newestDate}</td>
						<td>${item.oldestDate}</td>
					</tr>
				</c:forEach> --%>
				<c:forEach items="${favList}" var="item">
					<tr>
						<td>${item.group}</td>
						<td>${item.likes}</td>
						<td>${item.newest}</td>
						<td>${item.oldest}</td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>

	</div>


	<div class="tab-pane fade p-5" id="videoList" role="tabpanel"
		aria-labelledby="videoList-tab">
		<form action="VideoByYearServlet" method="post" role="form">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<label>Video Title <select name="maPhim"
							id="videoUserId" class="ml-3 form-control">
								<c:forEach var="item" items="${listVideos}">
									<option value="${item.getMaPhim()}">${item.getTitle()}</option>
								</c:forEach>
						</select>
						</label> 
						<button class="ml-3 btn btn-info" formaction="user">Report</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<table class="table table-bordered">
						<thead>
							<tr class="text-center bg-info text-white">
								<th scope="col" class="text-uppercase">Username</th>
								<th scope="col" class="text-uppercase">Fullname</th>
								<th scope="col" class="text-uppercase">Email</th>
								<th scope="col" class="text-uppercase">Favorite Date</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="item" items="${favUsers}">
								<tr>
									<td>${item.username }</td>
									<td>${item.fullname }</td>
									<td>${item.email }</td>
									<td>${item.likeDate }</td>
		<%-- 						<td>${item.getUsername() }</td>
									<td>${item.getFullname() }</td>
									<td>${item.getEmail() }</td>
									<td>${item.getLikeDate() }</td> --%>
								</tr>
							</c:forEach> 
						</tbody>
					</table>
				</div>
			</div>
		</form>

	</div>

	<div class="tab-pane fade p-5" id="shareFriends" role="tabpanel"
		aria-labelledby="shareFriends-tab">
		<form action="ReportSendMailServlet" method="post">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<label>Video Title <select name="maPhim"
							id="videoUserId" class="ml-3 form-control">
								<c:forEach var="item" items="${listVideos}">
									<option value="${item.getMaPhim()}">${item.getTitle()}</option>
								</c:forEach>
						</select>
						</label> 
						<button class="ml-3 btn btn-info">Report</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<table class="table table-bordered">
						<thead>
							<tr class="text-center bg-info text-white">
								<th scope="col" class="text-uppercase">Username</th>
								<th scope="col" class="text-uppercase">Sender Email</th>
								<th scope="col" class="text-uppercase">Reciever Email</th>
								<th scope="col" class="text-uppercase">Send Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${lstUserMail}">
								<tr>
									<td>${item.senderName }</td>
									<td>${item.senderEmail }</td>
									<td>${item.receiverEmail }</td>
									<td>${item.shareDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>


</div>
		
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

	<!-- Tag To top -->
	<a href="#" class="to-top"> <i class="fas fa-chevron-up"></i>
	</a>
	<!-- Tag To top -->

	<!-- Link Javascript -->
	<script type="text/javascript" src="../js/javascript.js"></script>
	<script type="text/javascript" src="../js/script.js"></script>
	<script src="../js/managerPhim.js" type="text/javascript"></script>
	<!-- Link Javascript -->

</body>
</html>