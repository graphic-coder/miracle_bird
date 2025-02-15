<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파티 생성 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="resources/css/partyCreate13.css" rel="stylesheet" type="text/css">
    <link
        href=“https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300&display=swap”
        rel=“stylesheet”>
    <link rel=“stylesheet”
    href=“https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css”>
    <title>파티 생성</title>
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
                <ul class="nav-container">
                    <li class="nav-item"><a href="#">COMMUNITY</a></li>
                    <li class="nav-item"><a href="#">JOIN</a></li>
                    <li class="nav-item"><a href="#">MY PARTY</a></li>
                    <li class="nav-item"><a href="#">PROFILE</a></li>
                    <li class="nav-item"><a href="#">STORE</a></li>
                    <li class="nav-item"><button>LOGIN</button></a></li>
                </ul>
            </nav>
        </div>
    </header>
    <form>
    <div class="top">
        <div class="title">Create <br> Your Party</div>
        <div class="name">
            Party Name <br>
            <input placeholder="파티 명을 입력해주세요" width="300px" style="font-size: 17px; border: none;">
        </div>
        <div class="wel">
            Welcome <br>
            <textarea class="welTxt" placeholder="파티 소개글을 작성해주세요"></textarea>
        </div>
    </div>
    <div class="partyInfo">
        <div class="time">
            <img src="resources/img/time.jpeg" width="330px">
            <div class="Info">
                <a style="float: left; margin-left: 20px; ">Time</a><br>
                    <a style="font-weight: normal; margin: auto;">Start</a> <input type="time" name="miracleStartTime" min="04:00:00" max="12:00:00" class="inputTime" />
                    <br>
                    <a style="font-weight: normal; margin-right: 9px;">End</a> <input type="time" name="miracleEndTime" min="04:00:00" max="12:00:00" class="inputTime" />
            </div>
        </div>
        <div class="activity">
            <img src="resources/img/activity.jpeg" width="330px" height="220px">
            <div class="Info">
                <a style="float: left; margin-left: 20px;">Activity</a><br>
                <input placeholder="활동을 입력해주세요" class="infoInput">
            </div>
        </div>
        <div class="people">
            <img src="resources/img/people.jpeg" width="330px" height="220px" >
            <div class="Info">
                <a style="float: left; margin-left: 20px;">People</a><br>
                <a style="font-size: 15px;">파티 인원은 최소 5명입니다<br>파티 인원 추가 시 STORE를 이용해주세요!</a>
            </div>
        </div>      
    </div>
    <div class="btnClass">
        <button class="btnParty" style="background-color: white;">Cancle</button>
        <button class="btnParty" type="submit" style="background-color: #ffb100;">Create</button>
    </div>
    </form>
</body>
</html>