<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.multi.miraclebird.store.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포인트 충전소</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pointLoad98.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<%
	DecimalFormat df = new DecimalFormat("###,###");
	int myPoint = (int) request.getAttribute("myPoint");
	%>
	<!-- 프로필 -->
	<div class="profile">
		<div class="circle-container">
			<img src="../resources/img/profile.png" alt="">
		</div>
		<div class="account">@${userVO.username}</div>
		<div class="point-container">
			<img src="../resources/img/money.svg" alt="저금통" class="point-icon">
			<span class="point"><%=df.format(myPoint)%></span>
		</div>
		<div class="category">
			<div>
				<%
				int cateNum2 = (int) request.getAttribute("cateNum");
				List<CategoryVO> cateList = (List<CategoryVO>) request.getAttribute("cateList");
				for (int p = 0; p < cateList.size(); p++) {
					if (cateList.get(p).getCategoryId() == cateNum2) {
				%>
						<a href="productList?page=1&categoryId=<%=cateList.get(p).getCategoryId()%>">
							<div class="color color-box category-item">
								<img src="../resources/img/<%=cateList.get(p).getCategoryImg()%>" alt="<%=cateList.get(p).getCategoryName()%>" class="color-icon"> 
								<span class="color-text"><%=cateList.get(p).getCategoryName()%></span>
							</div>
						</a>
				<%
					} else {
				%>
						<a href="productList?page=1&categoryId=<%=cateList.get(p).getCategoryId()%>">
							<div class="speech-bubble category-item">
								<img src="../resources/img/<%=cateList.get(p).getCategoryImg()%>" alt="<%=cateList.get(p).getCategoryName()%>" class="bubble-icon mouseover"> 
								<span class="color-text"><%=cateList.get(p).getCategoryName()%></span>
							</div>
						</a>
				<%	
					}
				}
				%>
			</div>
			<div class="btn-container">
				<a href="pointList">
					<div class="add-point btn">
						<img src="../resources/img/add-coin.svg" alt="포인트"	class="add-icon mouseover"> 
						<span class="add-text mouseover">포인트 충전</span>
					</div>
				</a>
				<a href="purchaseList">
					<div class="buy-history btn">
						<img src="../resources/img/list.svg" alt="포인트"	class="add-icon mouseover"> 
						<span class="add-text mouseover">구매 내역</span>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- 메인 -->
	<div class="main">
		<!-- 헤더 -->
		<header>
			<div class="head">
				<!-- 네비게이션바 -->
				<nav>
					<ul class="nav-container">
						<li class="nav-item"><a href="#">COMMUNITY</a></li>
						<li class="nav-item"><a href="/miraclebird/recruit/list">FIND</a></li>
						<c:if test="${partyId != null}">
							<li class="nav-item"><a href="/miraclebird/party/main">MY PARTY</a></li>
						</c:if>
						<li class="nav-item"><a href="/miraclebird/myFeed">MY FEED</a></li>
						<li class="nav-item"><a href="/miraclebird/profile">PROFILE</a></li>
						<li class="nav-item"><a	href="/miraclebird/store/productList?page=1&categoryId=1">STORE</a></li>
						<li class="nav-item"><c:choose>
								<c:when test="${userVO.userId == null}">
									<a href="/miraclebird/loginPage"><button>LOGIN</button></a>
								</c:when>
								<c:otherwise>
									<a href="/miraclebird/logout"><button>LOGOUT</button></a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</nav>
			</div>
		</header>

		<!-- 컨텐츠 -->
		<div class="contents-inner">
			<div class="contents-title">포인트 충전소</div>
			<div>포인트 구매를 통해서 파티원들만의 공간을 꾸며보아요!</div>
			<div class="contents">
				<c:forEach items="${pointVO}" var="one">
					<div class="content">
						<div class="content-image">
							<span class="point">P ${one.pointAmount}</span> <img
								src="../resources/img/${one.pointPrice}.png"
								alt="${one.pointPrice}">
						</div>
						<div class="content-text">
							<form action="pointBuy">
								<input type="hidden" name="pointId" value="${one.pointId}">
								<input type="hidden" name="pointAmount" value="${one.pointAmount}">
								<input type="hidden" name="pointPrice" value="${one.pointPrice}">
								<input type="hidden" name="username" value="${userVO.username}">
								<button>구매하기</button>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>
</body>

</html>