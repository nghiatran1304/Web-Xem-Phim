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
		<h1 class="text-center">FORM PHIM</h1>
		<form class="pb-4" action="${u}/index" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label>Mã phim:</label> <input type="text"
					value="${phim.getMaPhim()}" name="maPhim" class="form-control" 
					id="maPhim" ${disMaPhim?'readonly':''}>
			</div>
			<div class="form-group">
				<label>Title</label> <input type="text" value="${phim.getTitle()}"
					name="title" class="form-control" id="title">
			</div>
			<div class="form-group">
				<label>Nội dung:</label>
				<textarea name="noiDung" id="noiDung" cols="10" rows="5"
					class="form-control">${phim.getNoiDung()}</textarea>
			</div>
			<div class="form-group">
				<label>Độ phân giải:</label> <select name="doPhanGiai"
					id="doPhanGiai" class="custom-select form-control">

					<c:choose>
						<c:when test="${empty phim.getDoPhanGiai()}">
							<option selected>--Chọn--</option>
						</c:when>
						<c:otherwise>
							<option>--Chọn--</option>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${phim.getDoPhanGiai().equals('HD')}">
							<option selected value="HD">HD</option>
						</c:when>
						<c:otherwise>
							<option value="HD">HD</option>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${phim.getDoPhanGiai().equals('HD+')}">
							<option selected value="HD+">HD+</option>
						</c:when>
						<c:otherwise>
							<option value="HD+">HD+</option>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${phim.getDoPhanGiai().equals('Full HD')}">
							<option selected value="Full HD">Full HD</option>
						</c:when>
						<c:otherwise>
							<option value="Full HD">Full HD</option>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${phim.getDoPhanGiai().equals('4K')}">
							<option selected value="4K">4K</option>
						</c:when>
						<c:otherwise>
							<option value="4K">4K</option>
						</c:otherwise>
					</c:choose>

				</select>
			</div>
			<div class="form-group">
				<label>Đạo diễn</label> <input type="text"
					value="${phim.getDaoDien()}" name="daoDien" class="form-control"
					id="daoDien">
			</div>
			<div class="form-group">
				<label>Ngày công chiếu:</label> <input
					value="${phim.getNgayCongChieu()}" name="ngayCongChieu" type="date"
					class="form-control" id="ngayCongChieu">
			</div>
			<div class="form-group">
				<label>Thời lượng:</label> <input type="number"
					value="${phim.getThoiLuong()}" name="thoiLuong"
					class="form-control" id="thoiLuong">
			</div>
			<div class="form-group">
				<label>Phụ đề:</label> <input type="text" value="${phim.getPhuDe()}"
					name="phuDe" class="form-control" id="phuDe">
			</div>
			<div class="form-group">
				<label>Trailer:</label> <input type="text"
					value="${phim.getTrailer()}" name="trailer" class="form-control"
					id="trailer">
			</div>
			<div class="form-group">
				<label>Link xem:</label> <input type="text"
					value="${phim.getLink()}" name="link" class="form-control"
					id="link">
			</div>
			<div class="form-group">
				<label>Hiệu lực: </label> <select name="hieuLuc" id="hieuLuc"
					class="custom-select form-control">

					<c:choose>
						<c:when test="${phim.isHieuLuc()}">
							<option selected value="true">Có hiệu lực</option>
						</c:when>
						<c:otherwise>
							<option value="true">Có hiệu lực</option>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${!phim.isHieuLuc()}">
							<option selected value="false">Vô hiệu hóa</option>
						</c:when>
						<c:otherwise>
							<option value="false">Vô hiệu hóa</option>
						</c:otherwise>
					</c:choose>

				</select>
			</div>
			<div class="form-group">
				<label>Poster:</label> <input type="file" name="poster" class="form-control file1" style="height: 43px">
			    <c:if test="${!empty edit}">
			       <img src="/WebMovie/fileImg1/${phim.getPoster()}" width="200" height="200">
			       <input name="editPost" type="text" style="display: none;" value="${phim.getPoster()}">
			    </c:if>
			</div>
			<div class="form-group">
				<label>Hình 1:</label> <input type="file" name="hinh1" class="form-control file2" style="height: 43px">
				<c:if test="${!empty edit}">
			       <img src="/WebMovie/fileImg1/${phim.getHinh1()}" width="200" height="200">
			       <input name="editHinh1" type="text" style="display: none;" value="${phim.getHinh1()}">
			    </c:if>
			</div>
			<div class="form-group">
				<label>Hình 2:</label> <input type="file" name="hinh2" class="form-control file3" style="height: 43px">
				<c:if test="${!empty edit}">
			       <img src="/WebMovie/fileImg1/${phim.getHinh2()}" width="200" height="200">
			       <input name="editHinh2" type="text" style="display: none;" value="${phim.getHinh2()}">			  
			    </c:if>
			</div>
			<div class="form-group">
				<label>Hình 3:</label> <input type="file" name="hinh3" class="form-control file4" style="height: 43px">
				<c:if test="${!empty edit}">
			       <img src="/WebMovie/fileImg1/${phim.getHinh3()}" width="200" height="200">
			       <input name="editHinh3" type="text" style="display: none;" value="${phim.getHinh3()}">			  
			    </c:if>
			</div>
			<div class="form-group">
				<label>Hình 4:</label> <input type="file" name="hinh4" class="form-control file5" style="height: 43px">
				<c:if test="${!empty edit}">
			       <img src="/WebMovie/fileImg1/${phim.getHinh4()}" width="200" height="200">
			       <input name="editHinh4" type="text" style="display: none;" value="${phim.getHinh4()}">			  
			    </c:if>
			</div>

			<div class="text-center">

				<c:choose>
					<c:when test="${!empty edit}">
						<button formaction="${u}/edit/${phim.getMaPhim()}"
							class="btn btn-primary">Lưu</button>
					</c:when>
					<c:otherwise>
						<button formaction="${u}/create" class="btn btn-primary">Lưu</button>
					</c:otherwise>
				</c:choose>

				<button formaction="${u}/index" class="btn btn-info">Mới</button>
				<button formaction="${u}/list" class="btn btn-danger">Danh sách</button>
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