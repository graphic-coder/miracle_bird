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
    <link href="resources/css/partyApplicants5.css" rel="stylesheet" type="text/css">
    <link
        href=“https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300&display=swap”
        rel=“stylesheet”>
    <link rel=“stylesheet”
    href=“https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css”>
    <title>Party Applicants</title>
</head>
<body>
    <header>
        <div class="head">
            <!-- 로고 -->
            <a href="#">
                <img src="resources/img/logo.svg" alt="로고" class="logo">
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
            <button class="btn">Main</button>
            <button class="btn">Feed</button>
            <button class="btn">Community</button>
            <button class="btn">Style</button>
            <button class="btn">People</button>
            <button class="btn" id="here" onload="backChange()" style="background-color:#ffb100">Applicants</button>
        </div>
    <div class="mainInfo">
        <div class="main">
            <div class="mainContent">
                <div class="content">
                    <div style="text-align: center; font-size: 20px; font-weight: bold; width: 250px; margin: auto; background-color: #ffb100; height: 50px; line-height: 50px; border-radius: 0px 0px 20px 20px;">Request to Join</div>
                    <div class="people">
                        <img src="resources/img/profile.png" class="icon">
                            <ul>
                                <li>
                                    회원 이름
                                </li>
                                <li>
                                    가입 신청 모임
                                </li>
                                <li>
                                    가입 신청 날짜
                                </li>
                            </ul>
                            <div class="partyApBtn">
                                <button class="btnA">수락</button>
                                <button class="btnB">거절</button>
                            </div>
                    </div>          
                    <div class="people">
                        <img src="resources/img/profile.png" class="icon">
                        
                    </div>          
                    <div class="people">
                        <img src="resources/img/profile.png" class="icon">
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