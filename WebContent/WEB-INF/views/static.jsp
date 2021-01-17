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

<script>
	setTimeout("fn_test()", 1000);
	var i = 1;
	function fn_test() {
		a.innerHTML = "글자바뀜" + i
		i++;
	}
	window.onload =function()
	{
		var select=document.getElementById("gubun");
	}
</script>

<style type="text/css">
div#dash {
	text-align: center;
	border: 2px solid red;
	height: 600px;
}

div#div_canvas {
	float: left;
	border: 1px solid green;
	width: 400px;
}

canvas {
	border: 3px solid black;
	height: 300px;
}
</style>


</head>
<body>
	<a href='/web' class="link_find">main</a>
	<div class="grid-container">
		<div class="item1">
			<!-- 
			<span id=a>원래내용</span>
			<h1>${msg}</h1><button type="button" id="reData">데이터 변경2</button>
			-->
			<form name="input" method="post" action="./account.do">
				<select name="type" id="type">
					<option value="in">IN</option>
					<option value="out">OUT</option>
					</select>
					
					<select name="gubun" id="gubun">
					<c:choose>
						<c:when test="${fn:length(gubun) > 0}">
							<c:forEach items="${gubun}" var="prt">							
								<option value="${prt.gubun_cd}}">${prt.gubun_nm}</option>								
							</c:forEach>
						</c:when>
						<c:otherwise>
							<option value="none">전체</option>
						</c:otherwise>
					</c:choose>	
				</select> <input type="submit" value="전송">				
			</form>
			
		</div>
		<div class="item2">

			<ui>
			<li><a href='../account/home.do' class="link_find">INCOME</a></li>
			<li><a href='../account/home.do' class="link_find">OUTCOME</a></li>
			</ui>

		</div>

		<div class="item3" style="overflow-x: auto;">

			<table class="type11">
				<thead>
					<tr>
						<th scope="cols">인덱스</th>
						<th scope="cols">금액</th>
						<th scope="cols">내용</th>
						<th scope="cols">타입</th>
						<th scope="cols">구분</th>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.idx }</td>
									<td>${row.value }</td>
									<td>${row.contents}</td>
									<td>${row.type }</td>
									<td>${row.gubun }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div id="dash">
				<div id="div_canvas">
					<canvas id="myChart"></canvas>
				</div>
				<div id="div_canvas">
					<canvas id="myChart2"></canvas>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

		<div class="item4">
		상세 내용
		<table class="inputTable">
			<tr>
				<td>Gubun1</td>				
				<td></td>
			</tr>
			<tr>
				<td>Type</td>				
				<td></td>
			</tr>
			<tr>
				<td>Contents</td>				
				<td></td>
			</tr>
			<tr>
				<td>Value</td>				
				<td></td>
			</tr>
		</table>
		
		</div>
		<div class="item5">Footer</div>
		<script>
			var ctx = document.getElementById('myChart');
			var myChart = new Chart(ctx, {

				type : 'bar',
				data : {
					labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
							'Orange' ],
					datasets : [ {
						label : '# of Votes',
						data : [ 12, 19, 3, 5, 2, 3 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});

			var ctx2 = document.getElementById('myChart2');
			var myChart2 = new Chart(ctx2, {
				type : 'bar',
				data : {
					labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
							'Orange' ],
					datasets : [ {
						label : '# of Votes',
						data : [ 12, 19, 3, 5, 2, 3 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});

			//데이터 변경
			document.getElementById('reData').onclick = function() {

				//alert(${list});
				//데이터셋 수 만큼 반복

				var dataset = myChart.data.datasets;
				for (var i = 0; i < dataset.length; i++) {
					console.log(dataset);
					//데이터 갯수 만큼 반복
					var data = dataset[i].data;
					for (var j = 0; j < data.length; j++) {
						//data[j] = list.size();
					}
				}

				myChart.update(); //차트 업데이트

			}
			

			
		</script>
		<script type="text/javascript">

			var target = document.getElementById("inOut");
			alert('선택된 옵션 text 값=' + target.options[target.selectedIndex].text); // 옵션 text 값
			alert('선택된 옵션 value 값='
					+ target.options[target.selectedIndex].value); // 옵션 value 값
		</script>





	</div>
</body>
</html>