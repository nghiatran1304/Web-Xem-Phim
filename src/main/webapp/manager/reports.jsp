<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<form action="" method="post" class="form-inline mt-3 mb-3">
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
		<form action="" method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<label>Video Title <select name="videoUserId"
							id="videoUserId" class="ml-3 form-control">
								<c:forEach var="item" items="${vidList}">
									<option value="${item.videoId}"
										${item.videoId == videoUserId ? 'selected' : '' }>${item.title}</option>
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
		<form action="" method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<label>Video Title <select name="" id=""
							class="ml-3 form-control">
								<option value="">Video 01</option>
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
								<th scope="col" class="text-uppercase">Sender Name</th>
								<th scope="col" class="text-uppercase">Sender Email</th>
								<th scope="col" class="text-uppercase">Reciever Email</th>
								<th scope="col" class="text-uppercase">Send Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Sender Name</td>
								<td>Sender Email</td>
								<td>Reciever Email</td>
								<td>Send Date</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>


</div>
