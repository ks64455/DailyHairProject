<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ReserveSelectDate</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/assets/img/DHS-icon.png" rel="icon">
<link href="/resources/assets/img/DHS-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/icofont/icofont.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/boxicons/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animate.css/animate.min.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/venobox/venobox.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css">

<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">

<!-- jQuery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- datepicker 설정 초기값 -->
<link href="/resources/dateAndTimePicker/dist/css/jquery-ui.css" rel="stylesheet" type="text/css">
<script src="/resources/dateAndTimePicker/dist/js/jquery-ui.js"></script>

<!-- =======================================================
	* Template Name: Delicious - v2.0.0
	* Template URL: https://bootstrapmade.com/delicious-free-restaurant-bootstrap-theme/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->

<!-- Vendor JS Files -->
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
<script src="/resources/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
<script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
<script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

<!-- Template Main JS File -->
<script type="text/javascript" src="/resources/assets/js/main_main.js"></script>

<!-- 버튼 이벤트 -->
<script type="text/javascript">
	$(function() {
		$("#datePicker").datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',		// 마우스 오버시 이전달 텍스트
			nextText: '다음 달',		// 마우스 오버시 다음달 텍스트
			closeText: '닫기',		// 닫기 버튼 텍스트 변경
			currentText: '오늘',		// 오늘 버튼 텍스트 변경
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
			showMonthAfterYear: true,	// true : 년 월 / false : 월 년 순으로 보여줌
			yearSuffix: '년',		// 년도 표시
			showButtonPanel: false	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
		}).on(
				"changeDate",
				function(e) {
					var date = $("#datePicker").val();
					
		});
	});
	
	// 이전 단계로 버튼 이벤트
	function backToSelectPlace() {
		location.replace("/reserve/backToSelectPlace.do");
	}

	// 디자이너 선택 버튼 이벤트
	function selectDesigner() {
		
		if($("#datePicker").val() == ''){
			alert("날짜를 선택하세요");
			return;
		}else if($("#rest_time").val()=='시간선택'){
			alert("시간을 선택하세요");
			return;
		}else{
		
		$("#timeForm").attr("method","get");
		$("#timeForm").attr("action","/reserve/reserveSelectDesigner.do");
		$("#timeForm").submit();
		
		}
		//location.replace("/reserve/reserveSelectDesigner.do");
	}
</script>

<style type="text/css">
.reserveTable {
	display: inline;
	padding: 10px;
	font-size: 12px;
}

.reserveTablehead {
	display: inline;
	padding: 10px;
	font: 15pt bold;
	color: #670000;
}

.reserveBtn {
	width: 150px;
	height: 50px;
	background: #ffb03b;
	border: 0;
	color: #fff;
	padding: 10px 24px;
	transition: 0.4s;
	border-radius: 50px;
	font-size: 15px;
}
.date_left{
	width: 250px;
	float: left;
}
.date_right{
	width: 250px;
	float: right;
	margin-left: 50px;
}
.datebox{
	min-width: 500px;
	max-width: 1020px;
	margin: 0 auto;
	padding: 30px;
	text-align: center;
}
</style>
</head>

<body>
	<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인해주세요");
			location.href="/";
		</script>
	</c:if>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= Reserve Section ======= -->
	<section id="about" class="about">
		<div class="container-fluid">
			<div class="row">
				<!-- 최상단 구분 -->
				<div style="width: 100%; height: 100px; margin-bottom: 50px;">
				</div>
				
				<!-- 상단 -->
				<div style="margin: 0 auto; text-align: center; width: 100%;">
					<h1 style="margin-bottom: 10px;">예약하기</h1>
					<p style="margin-bottom: 10px;">시술을 받기 원하시는 날짜와 시간을 선택해주세요.</p>
				</div>
				
				<div style="width: 100%; margin: 0 auto;">
					<hr style="border: 1 solid black; margin-bottom: 10px;" />
				</div>
				
				<!-- 예약 정보 -->
				<div style="margin: 0 auto;">
					<div class="reserveTablehead">예약 정보</div>
					<div class="reserveTable">${place}</div>
					<div class="reserveTable">(시술 일시)입력 대기 중</div>
					<div class="reserveTable">(디자이너)입력 대기 중</div>
					<div class="reserveTable">(시술)입력 대기 중</div>
					<div></div>
					<div class="reserveTablehead" style="float: left;">결제 금액</div>
					<div class="reserveTable" style="float: right;">(금액)입력 대기 중</div>
				</div>
				
				<div style="width: 100%; margin: 0 auto;">
					<hr style="border: 1 solid black; margin-top: 10px;" />
				</div>
				
				<!-- 달력 노출 및 일자 선택 -->
				<div class="datebox">
					<form id="timeForm" name="timeForm">
						<div class="date_left">
							<label>1. 날짜를 선택해주세요.</label><br>
							<input type="text" class="datepicker" id="datePicker" name="rest_hairdate"
								placeholder="날짜 선택" data-language="ko" readonly="readonly"
								style="width: 150px; height: 35px; text-align: center;">
						</div>
						<div class="date_right">
							<label>2. 시간을 선택해주세요.</label><br>
							<select id="rest_time" name="rest_time"
								style="width: 100px;" >
								<option value="시간선택"></option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">16:00</option>
								<option value="16:30">16:30</option>
								<option value="17:00">17:00</option>
							</select>
						</div>
					</form>
				</div>
				
				<div style="width: 100%; margin: 0 auto;">
					<hr style="border: 0; margin-top: 10px;" />
				</div>
				
				<!-- 버튼 -->
				<div style="margin: 0 auto; margin-top: 150px;">
					<button class="reserveBtn" onclick="backToSelectPlace()">이전
						단계</button>
					<button class="reserveBtn" onclick="selectDesigner()">디자이너
						선택</button>
				</div>
				
			</div>
		</div>
	</section>
	<!-- End Reserve Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>