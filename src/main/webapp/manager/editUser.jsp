<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/675bbfe78c.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
	<c:url var="urlUser" value="/manager/editUser" />

	<!-- Tag nav -->
	<%@include file="nav.jsp"%>
	<!-- Thẻ Nav -->
	<form action="${urlUser}/index" method="post">
		<div class="container">
			<h2>Danh sách người dùng</h2>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Tên ĐN</th>
						<th>Họ</th>
						<th>Tên</th>
						<th>Email</th>
						<th>Vai trò</th>
						<th>Hoạt động</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.getTenDN()}</td>
							<td>${item.getHo()}</td>
							<td>${item.getTen()}</td>
							<td>${item.getEmail()}</td>
							<td>${item.isVaiTro()?'Nhân viên':'Người dùng'}</td>
							<td><a class="btn btn-primary btn-sm" href="#myModal2"
								data-toggle="modal" onclick="result2('${item.getTenDN()}')"
									formaction="">Cập nhật vai trò</a> | <a
								class="btn btn-danger btn-sm" href="#myModal"
								data-toggle="modal" onclick="result1('${item.getTenDN()}')">Xóa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="container pt-5 text-center pb-5">
				<ul class="pagination justify-content-center">
					<li class="page-item ${disBack?'disabled':''}"><button
							class="page-link" formaction="">
							<i class="fas fa-angle-double-left"></i>
						</button></li>
					<li class="page-item disabled"><a class="page-link">${page}</a></li>
					<li class="page-item ${disNext?'disabled':''}"><button
							class="page-link" formaction="">
							<i class="fas fa-angle-double-right"></i>
						</button></li>
				</ul>
				<label style="font-size: 15px;">Trang: <input type="number"
					max="${maxPage}" min="1" style="width: 30px;" value="${page}">/${maxPage}
				</label>
			</div>

			<!-- Modal xóa HTML -->
			<div id="myModal" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header flex-column">
							<div class="icon-box">
								<i class="material-icons">&#xE5CD;</i>
							</div>
							<h4 class="modal-title w-100">Bạn có chắc?</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>Mọi thông tin liên quan tới người dùng này sẽ bị xóa mất. Bạn có thực sự muốn xóa người dùng này không?</p>
						</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button formaction="${urlUser}/delete" class="btn btn-danger">Delete</button>
							<input type="text" name="maXoa" id="result" style="display: none;">
						</div>
					</div>
				</div>
			</div>
			
			<!-- Modal cập nhật HTML -->
			<div id="myModal2" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header flex-column">
							<div class="icon-box">
								<i class="material-icons">&#xE5CD;</i>
							</div>
							<h4 class="modal-title w-100">Bạn có chắc?</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>Bạn có muốn thay đổi vai trò của người dùng này không?</p>
						</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button formaction="${urlUser}/update" class="btn btn-danger">Update</button>
							<input type="text" name="maUpdate" id="result2" style="display: none;">
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

	
	<script type="text/javascript">
	   function result1(u){
      	  var temp = document.getElementById("result");
       	  temp.value = u;
        //salert(temp);
   	   }
	   
	   function result2(u){
	      	  var temp = document.getElementById("result2");
	       	  temp.value = u;
	        //salert(temp);
	   }
	</script>
	

</body>
</html>