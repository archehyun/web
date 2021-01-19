<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/table.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>


<style>
#wrapper {
	display: table;
	width: 100%;
}

#content {
	display: table-cell;
	vertical-align: middle;
}

.div-s {
	border-bottom-style: solid 1px black;
	margin-bottom: 10px
}
.chart_view{
	width: 100%;  



</style>

</head>
<body>

	<div id="wrapper">
		<div id="content">
			<div class="div-s">
				<form name="input" method="post" action="./static.do" class="item">

					<select name="dt_year" id="dt_year">
						<option value="2020"
							<c:if test="${input_year == '2020'}">selected</c:if>>2020년</option>
						<option value="2021"
							<c:if test="${input_year == '2021'}">selected</c:if>>2021년</option>

					</select> <input type="submit" value="조회">
				</form>
			</div>
			<div class="div-s">Income</div>

			<div class="div-s">

				<table class="type11" width="100%">
					<thead>
						<th scope="cols" width="100px">구분</th>
						<th scope="cols" class="th_row">1월</th>
						<th scope="cols" class="th_row">2월</th>
						<th scope="cols" class="th_row">3월</th>
						<th scope="cols" class="th_row">4월</th>
						<th scope="cols" class="th_row">5월</th>
						<th scope="cols" class="th_row">5월</th>
						<th scope="cols" class="th_row">7월</th>
						<th scope="cols" class="th_row">8월</th>
						<th scope="cols" class="th_row">9월</th>
						<th scope="cols" class="th_row">10월</th>
						<th scope="cols" class="th_row">11월</th>
						<th scope="cols" class="th_row">12월</th>
						<th scope="cols" class="th_row">누계</th>
						</tr>
						</thread>
					<tbody id="my-tbody">

						<c:choose>
							<c:when test="${fn:length(in_list) > 0}">
								<c:forEach items="${in_list }" var="row">

									<tr class="row">
										<td>${row.gubun_nm }</td>
										<td>${row.dt1 }</td>
										<td>${row.dt2 }</td>
										<td>${row.dt3 }</td>
										<td>${row.dt4 }</td>
										<td>${row.dt5 }</td>
										<td>${row.dt6 }</td>
										<td>${row.dt7 }</td>
										<td>${row.dt8 }</td>
										<td>${row.dt9 }</td>
										<td>${row.dt10 }</td>
										<td>${row.dt11 }</td>
										<td>${row.dt12 }</td>
										<td>${row.dt13 }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="14">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
			</div>

			<div class="div-s">Outcome</div>
			<div class="div-s">

				<table class="type11" width="100%">
					<thead>
						<th scope="cols" width="100px">구분</th>
						<th scope="cols" class="th_row">1월</th>
						<th scope="cols" class="th_row">2월</th>
						<th scope="cols" class="th_row">3월</th>
						<th scope="cols" class="th_row">4월</th>
						<th scope="cols" class="th_row">5월</th>
						<th scope="cols" class="th_row">5월</th>
						<th scope="cols" class="th_row">7월</th>
						<th scope="cols" class="th_row">8월</th>
						<th scope="cols" class="th_row">9월</th>
						<th scope="cols" class="th_row">10월</th>
						<th scope="cols" class="th_row">11월</th>
						<th scope="cols" class="th_row">12월</th>
						<th scope="cols" class="th_row">누계</th>
						</tr>
						</thread>
					<tbody id="my-tbody">

						<c:choose>
							<c:when test="${fn:length(out_list) > 0}">
								<c:forEach items="${out_list }" var="row" varStatus="status">

									<c:choose>

										<c:when test="${status.last==true}">
											<tr class="row" onclick="btnView_Enc_Click('1')"
												bgcolor="lightblue">
												<td>합계</td>
												<td>${row.dt1 }</td>
												<td>${row.dt2 }</td>
												<td>${row.dt3 }</td>
												<td>${row.dt4 }</td>
												<td>${row.dt5 }</td>
												<td>${row.dt6 }</td>
												<td>${row.dt7 }</td>
												<td>${row.dt8 }</td>
												<td>${row.dt9 }</td>
												<td>${row.dt10 }</td>
												<td>${row.dt11 }</td>
												<td>${row.dt12 }</td>
												<td>${row.dt13 }</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr class="row" onclick="btnView_Enc_Click('1')">
												<td>${row.gubun_nm }</td>
												<td>${row.dt1 }</td>
												<td>${row.dt2 }</td>
												<td>${row.dt3 }</td>
												<td>${row.dt4 }</td>
												<td>${row.dt5 }</td>
												<td>${row.dt6 }</td>
												<td>${row.dt7 }</td>
												<td>${row.dt8 }</td>
												<td>${row.dt9 }</td>
												<td>${row.dt10 }</td>
												<td>${row.dt11 }</td>
												<td>${row.dt12 }</td>
												<td>${row.dt13 }</td>
											</tr>
										</c:otherwise>

									</c:choose>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="14">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>


			</div>
			<div class="div-s">
					<canvas id="canvas" class="chart_view" ></canvas>
				
				<button id="randomizeData">Randomize Data</button>
				<button id="addDataset">Add Dataset</button>
				<button id="removeDataset">Remove Dataset</button>
				<button id="addData">Add Data</button>
				<button id="removeData">Remove Data</button
			</div>
		</div>



	</div>
</body>
<script type="text/javascript">


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function addComma(value) {
	  var num = isNumber(value);
	  if (!num) return;

	  // 문자열 길이가 3과 같거나 작은 경우 입력 값을 그대로 리턴
	  if (num.length <= 3) {
	    return num;
	  }

	  // 3단어씩 자를 반복 횟수 구하기
	  var count = Math.floor((num.length - 1) / 3);

	  // 결과 값을 저정할 변수
	  var result = "";

	  // 문자 뒤쪽에서 3개를 자르며 콤마(,) 추가
	  for (var i = 0; i < count; i++) {

	    // 마지막 문자(length)위치 - 3 을 하여 마지막인덱스부터 세번째 문자열 인덱스값 구하기
	    var length = num.length;
	    var strCut = num.substr(length - 3, length);
	    // 반복문을 통해 value 값은 뒤에서 부터 세자리씩 값이 리턴됨.

	    // 입력값 뒷쪽에서 3개의 문자열을 잘라낸 나머지 값으로 입력값 갱신
	    num = num.slice(0, length - 3);

	    // 콤마(,) + 신규로 자른 문자열 + 기존 결과 값
	    result = "," + strCut + result;
	  }


}
window.chartColors = {
	      red: 'rgb(255, 99, 132)',
	      orange: 'rgb(255, 159, 64)',
	      yellow: 'rgb(255, 205, 86)',
	      green: 'rgb(75, 192, 192)',
	      blue: 'rgb(54, 162, 235)',
	      purple: 'rgb(153, 102, 255)',
	      grey: 'rgb(201, 203, 207)'
	    };

var randomScalingFactor = function() {
	return Math.round(Math.random() * 100);
};
	
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: 'Dataset 1',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: 'Dataset 2',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					legend: false,
					title: {
						display: false,
						text: 'Chart.js Bar Chart'
					}
				}
			});

		}; 

	
	</script>



</html>