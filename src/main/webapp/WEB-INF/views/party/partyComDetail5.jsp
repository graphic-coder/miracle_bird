<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/partyComDetail5.css" rel="stylesheet" type="text/css">
    <link
        href=“https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300&display=swap”
        rel=“stylesheet”>
    <link rel=“stylesheet”
    href=“https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css”>
    <title>Party Feed</title>
</head>
<body>
    <header>
        <div class="head">
            <!-- 로고 -->
            <a href="#">
                <img src="${pageContext.request.contextPath}/resources/img/logo.svg" alt="로고" class="logo">
            </a>
            <!-- 네비게이션바 -->
            <nav>
                <ul class="nav-container animate__animated animate__fadeIn">
                    <li class="nav-item"><a href="/miraclebird">COMMUNITY</a></li>
                    <li class="nav-item"><a href="/miraclebird/recruit/list">JOIN</a></li>
                    <c:if test="${partyId != null}">
                    	<li class="nav-item"><a href="/miraclebird/party/main">MY PARTY</a></li>
                    </c:if>
                    <li class="nav-item"><a href="/miraclebird/myFeed">MY FEED</a></li>
                    <li class="nav-item"><a href="/miraclebird/profile">PROFILE</a></li>
                    <li class="nav-item"><a href="/miraclebird/store/productList?page=1&categoryId=1">STORE</a></li>
                    <li class="nav-item">
                    	<c:choose>
                    		<c:when test="${userId == null}">
                    			<a href="/miraclebird/loginPage"><button>LOGIN</button></a>
                    		</c:when>
                    		<c:otherwise>
                    			<a href="/miraclebird/logout"><button>LOGOUT</button></a>
                    		</c:otherwise>
                    	</c:choose>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <div >
        <div class="cate">
            <a href="/miraclebird/party/main">
            	<button class="btn">Main</button>
            </a>
            <a href="/miraclebird/party/feed?page=1">
            	<button class="btn">Feed</button>
            </a>
            <a href="/miraclebird/party/community">
	            <button class="btn" id="here" onload="backChange()" style="background-color:#ffb100">Community</button>
            </a>
            <a href="/miraclebird/party/members">
            	<button class="btn">People</button>
            </a>
            <c:if test="${isLeader}">
            	<a href="/miraclebird/party/applicants">
            		<button class="btn">Applicants</button>
            	</a>
            </c:if>
            <c:if test="${isLeader}">
            	<a href="/miraclebird/party/style">
            		<button class="btn">Style</button>
            	</a>
            </c:if>
        </div>
    <div class="mainInfo">
        <div class="main">
            <div class="mainContent">
                <div class="left">
                    <img src="${pageContext.request.contextPath}/resources/img/profile.png" style="padding: 40px; width:180px; height: 180px;"><br>
                    <h4 class="userName" style="height: 50px;">${partyBoardVO.username}</h4>
                </div>
                <div class="right">
                    <h4 >${partyBoardVO.writeDate}</h4>
                    <c:if test="${userId == partyBoardVO.userId}">
	                    <div class="btnClass">
	                    	<a href="/miraclebird/party/community/${partyBoardVO.partyBoardId}/update">
		                        <button class="update">수정</button>
	                    	</a>
	                    	<a href="/miraclebird/party/community/${partyBoardVO.partyBoardId}/delete">
		                        <button class="delete">삭제</button>
	                    	</a>
	                    </div>
                    </c:if>
                    <hr>
                    <h4>
                    	${partyBoardVO.content}
                    </h4>
                    <hr>
                    <div class="containerForm">
                        <label for="content">comment</label>
                        <form name="commentInsertForm" action="">
                            <div class="input-group">
                                <input type="hidden" name="bno" value="${detail.bno}"/>
                                <input type="text" style="border: #ffb100 2px solid; border-radius: 20px; padding: 20px;"
                            class="comment" name="comment" placeholder="내용을 입력하세요.">
                                <span>
                                    <button class="commentBtn" type="button">등록</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    
                    <div class="container">
                        <div class="commentList"></div>
                    </div>
                </div>
            </div>
            <div class="mainText" onload="backChange()" id="bg">
                <a><marquee>${partyVO.intro}</marquee> </a>
            </div>
        </div>
        
    </div>
    </div>
    <script lang="javascript">

        function backChange(){
            // 데이터에 있는 색상 코드 입력
            var Acolor = new Array('red', 'orange', 'green'); 
            var Bcolor = Math.floor(Math.random() * Acolor.length);
            var Ccolor = Acolor[Bcolor]; 
            document.getElementById('bg').style.background=Ccolor;
            document.getElementById('here').style.background=Ccolor;
            }  
            setInterval(backChange,2000);

    </script>

</body>
</html>