<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="../css/fontello.css">
<link rel="stylesheet" href="../css/table.css" />
<link rel="stylesheet" href="../css/tab.css" />
<link rel="stylesheet" href="../css/layout2.css" />


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="../js/common.js" charset="UTF-8"></script>
<link rel="stylesheet" href="../js/jquery-ui.css">
<script src="../js/jquery-ui.js"></script>
<script src="../js/datepicker-ko.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js">
	<script type="text/javascript">
	$(function() {

		$("#input_date").datepicker({

			onSelect : function(dateText, inst) {
				console.log(dateText);

			}

		});

	});
</script>


<style>
.tb_wrap {
	position: relative;
	width: 1000px;
	margin: 20px auto;
	padding-top: 43px;
}

.tb_box {
	overflow: auto;
	padding-top: 0;
}

.warapper {
	height: 95%;
	border: solid 1px gray;
	border-top: solid 2px black;
}

.scrolltable {
	table-layout: fixed;
	border-collapse: collapse;
	border: 1px solid #888;
}

.scrolltable thead {
	background: #a88;
	color: #fff;
}
/* 행 장식 */
.scrolltable th, .scrolltable td {
	padding: 10px;
	text-align: left;
	width: 100px;
	text-align: center;
	font-size: 0.875em;
}

.scrolltable tbody tr:nth-child(2n+1) {
	background-color: #f0f0f0;
}

.scrolltable thead {
	display: block;
	background: #a88;
	color: #fff;
}

.scrolltable tbody {
	display: block;
	height: 190px;
}

#gubun {
	width: 150px;
}

.canvas-holder {
	width: 100%;
	height: 250px;
}
.title_label{
width: 100%;
text-align: left;
padding-left: 10px;
}

</style>

</head>
<body>

	<div class="container">
		<div class="sub_head">

				<!-- 상단 검색 영역 -->
				  기간 : <select
					name="input_year" id="input_year">

					<option value="2022"
						<c:if test="${input_year == '2022'}">selected</c:if>>2022년</option>

					<option value="2021"
						<c:if test="${input_year == '2021'}">selected</c:if>>2021년</option>

					<option value="2020"
						<c:if test="${input_year == '2020'}">selected</c:if>>2020년</option>

				</select> <select name="input_month" id="input_month">

					<!-- 자동 생성으로 변경 -->
					<option value="none">전체</option>
					<option value="01"
						<c:if test="${input_month == '01'}">selected</c:if>>1월</option>
					<option value="02"
						<c:if test="${input_month == '02'}">selected</c:if>>2월</option>
					<option value="03"
						<c:if test="${input_month == '03'}">selected</c:if>>3월</option>
					<option value="04"
						<c:if test="${input_month == '04'}">selected</c:if>>4월</option>
					<option value="05"
						<c:if test="${input_month == '05'}">selected</c:if>>5월</option>
					<option value="06"
						<c:if test="${input_month == '06'}">selected</c:if>>6월</option>
					<option value="07"
						<c:if test="${input_month == '07'}">selected</c:if>>7월</option>
					<option value="08"
						<c:if test="${input_month == '08'}">selected</c:if>>8월</option>
					<option value="09"
						<c:if test="${input_month == '09'}">selected</c:if>>9월</option>
					<option value="10"
						<c:if test="${input_month == '10'}">selected</c:if>>10월</option>
					<option value="11"
						<c:if test="${input_month == '11'}">selected</c:if>>11월</option>
					<option value="12"
						<c:if test="${input_month == '12'}">selected</c:if>>12월</option>
				</select> ~ <select name="input_year_to" id="input_year_to">
					<option value="2020">2020년</option>
					<option value="2021">2021년</option>

				</select>
				<!-- 자동 생성으로 변경 -->
				<select name="input_month_to" id="input_month_to">

					<option value="none">전체</option>
					<option value="01"
						<c:if test="${input_month == '01'}">selected</c:if>>1월</option>
					<option value="02"
						<c:if test="${input_month == '02'}">selected</c:if>>2월</option>
					<option value="03"
						<c:if test="${input_month == '03'}">selected</c:if>>3월</option>
					<option value="04"
						<c:if test="${input_month == '04'}">selected</c:if>>4월</option>
					<option value="05"
						<c:if test="${input_month == '05'}">selected</c:if>>5월</option>
					<option value="06"
						<c:if test="${input_month == '06'}">selected</c:if>>6월</option>
					<option value="07"
						<c:if test="${input_month == '07'}">selected</c:if>>7월</option>
					<option value="08"
						<c:if test="${input_month == '08'}">selected</c:if>>8월</option>
					<option value="09"
						<c:if test="${input_month == '09'}">selected</c:if>>9월</option>
					<option value="10"
						<c:if test="${input_month == '10'}">selected</c:if>>10월</option>
					<option value="11"
						<c:if test="${input_month == '11'}">selected</c:if>>11월</option>
					<option value="12"
						<c:if test="${input_month == '12'}">selected</c:if>>12월</option>
				</select> <br>구분 : <input type="hidden" id="inout_type"
					value="<c:out value="${inout_type}"/>" />

				<!-- 				<select name="type_c" id="inout_type">

					<option value="none">전체</option>
					<option value="o" <c:if test="${inout_type == 'o'}">selected</c:if>>OUT</option>
					<option value="i" <c:if test="${inout_type == 'i'}">selected</c:if>>IN</option>
				</select> -->
				<select name="gubun" id="gubun">
					<c:choose>
						<c:when test="${fn:length(gubun) > 0}">
							<option value="none">전체</option>
							<c:forEach items="${gubun}" var="prt">
								<option value="${prt.gubun_cd}"
									<c:if test="${prt.gubun_cd == gubun_cd}">selected</c:if>>${prt.gubun_nm}</option>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<option value="none">전체</option>
						</c:otherwise>
					</c:choose>
				</select> <input type="test" name="searchVal" id="searchVal" />

			<!--  검색 영역 종료 -->

			<div class="item last">

				<input type="submit" value="조회" onclick="fn_select()"> <input
					type="button" value="추가" onclick="fn_insert()" /> <input
					type="button" value="삭제" onclick="fn_delete()" /> <input
					type="button" value="수정" onclick="fn_update()" />

			</div>
		</div>
		<!--  탭 영역 -->
		<ul class="tab">
			<li data-tab="tab1"
				<c:if test="${inout_type== 'o'}">class='current'</c:if>><a
				href="#">Outgoing</a></li>
			<li data-tab="tab2"
				<c:if test="${inout_type== 'i'}"> class='current'</c:if>><a
				href="#">Incoming</a></li>
		</ul>

		<div class="content">
			<div class="left">
				<div class="warp">
					<div>
						<i class="icon-expand-right">목록</i>
					</div>
					<div class="table_wrap">
						<table class="table_type1" id="example-table-1">
							<thead>
								<tr>
									<th scope="cols" width="25px"><input type="checkbox"
										name="_selected_all_"></th>
									<th scope="cols" style="display: none;">인덱스</th>
									<th scope="cols" width="100px">구분</th>
									<th scope="cols" width="150px">금액</th>
									<th scope="cols" width="300px">내용</th>
									<th scope="cols" width="100px">일자</th>
									<th scope="cols" width="100px">이름</th>
								</tr>
							</thead>

							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr class="row" onclick="btnView_Enc_Click('1')">
												<td><input type="checkbox" name="_selected"></td>
												<td style="display: none;">${row.idx }</td>
												<td>${row.gubun_nm }</td>
												<td>${row.value }</td>
												<td>${row.contents}</td>
												<td>${row.dt }</td>
												<td>${row.ur_id }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="col-lg-12" id="ex1_Result1"></div>
					<div class="col-lg-12" id="ex1_Result2"></div>
				</div>
			</div>
			<div class="right">

				<div class="warp">
					<div>
						<i class="icon-expand-right">상세 내용</i>
					</div>
					<div class="table_wrap">
						<form>
							
							<table class="inputTable">
								<tr>
									<td>일자</td>
									<td><input type="text" name="date" id="input_date"
										size="12" /> <input type="button" value="달력"
										onclick="$('#input_date').datepicker('show');" /></td>
								</tr>					

								<tr>
									<td>Gubun</td>
									<td><select name="gubun2" id="input_gubun"
										width="100%">
											<c:choose>
												<c:when test="${fn:length(gubun) > 0}">
													<c:forEach items="${gubun}" var="prt">
														<option value="${prt.gubun_cd}">${prt.gubun_nm}</option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="none">전체</option>
												</c:otherwise>
											</c:choose>
									</select></td>
								</tr>

								<tr>
									<td>Contents</td>
									<td><input id="contents" type="text" name="contents"
										size="20"></td>
								</tr>
								<tr>
									<td>Value</td>
									<td><input id="input_value" type="text" name="value"
										size="20"></td>
								</tr>
							</table>

						</form>

						<table class="inputTable">
							<thead>
								<tr>
									<th scope="cols" width="100px">구분</th>
									<th scope="cols" width="150px">금액</th>

								</tr>
							</thead>
							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(sub_list) > 0}">
										<c:forEach items="${sub_list }" var="row">
											<tr class="row">

												<td>${row.gubun_nm }</td>
												<td>${row.sum }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<h2>
							
							<div  class="title_label">금액 : <c:out value="${sum}" /></div>
						</h2>
						<div id="canvas-holder">
							<canvas id="chart-area"></canvas>
						</div>


					</div>

				</div>

			</div>
		</div>

		<script>
		
			var selectedTab;
			
			this.fn_init = function(inout_type) {
				
				var input_year = document.getElementById('input_year').value;
				var input_month = document.getElementById('input_month').value;
				
				
				var master = {
					"inout_type" : inout_type,
					"input_year" : input_year,
					"input_month" : input_month,
				}

				var datas = {
					svcid : "init",
					url : "../account/tab.do",
					args : master
				}

				try {

					this.gfn_transaction(datas.url, datas, fn_callback);
				} catch (e) {
					alert(e.message);
				}
			}

			this.fn_insert = function() {
				
				var input_gubun_cd = document.getElementById('input_gubun').value;
				var gubun_cd = document.getElementById('gubun').value;
				var inout_type = document.getElementById('inout_type').value;
				var input_date = document.getElementById('input_date').value;
				var input_year = document.getElementById('input_year').value;
				var input_month = document.getElementById('input_month').value;
				var contents = document.getElementById('contents').value;
				var input_value = document.getElementById('input_value').value;
				
				var ur_id= '<c:out value="${sessionScope.id}"/>';

				console.log("input_gubun_cd:" + input_gubun_cd);
				console.log("input_date:" + input_date + ", inout_type:"
						+ inout_type + ", contents:" + contents
						+ ", input_value:" + input_value);
				
				console.log("ur_id:"+ur_id);
				
				
				if (input_month == 'none') {
					input_month='';
				}
				
				if(input_gubun_cd=='none')
				{
					alert('gubun none')
					return;
				}

				var master = {
					"input_gubun_cd" : input_gubun_cd,
					"gubun_cd" : gubun_cd,
					"inout_type" : inout_type,
					"input_value" : input_value,
					"contents" : contents,
					"input_year" : input_year,
					"input_month" : input_month,
					"input_date" : input_date,
					"ur_id":ur_id
				}

				var datas = {
					svcid : "insert",
					url : "../account/insert.do",
					name : "inout_type",
					value : inout_type,
					var_input_date : input_date,
					args : master
				}

				try {

					this.gfn_transaction(datas.url, datas, fn_callback);
				} catch (e) {
					alert(e.message);
				}

			}

			this.fn_select = function() {

				var inout_type = document.getElementById('inout_type').value;
				
				console.log("inout_type:"+document.getElementById('inout_type'));
				var gubun_cd = document.getElementById('gubun').value;
				var input_year = document.getElementById('input_year').value;
				var input_month = document.getElementById('input_month').value;
				var searchVal = document.getElementById('searchVal').value;

				var input_date;

				if (inout_type == 'none') {
					inout_type = ''
				}

				if (gubun_cd == 'none') {
					gubun_cd = ''
				}

				if (input_month != 'none') {
					input_date = input_year + "-" + input_month;
				} else {
					input_date = input_year;
				}

				console.log(input_date)

				var master = {

					"inout_type" : inout_type,
					"gubun_cd" : gubun_cd,
					"input_date" : input_date,
					"input_year" : input_year,
					"input_month" : input_month,
					"searchVal" : searchVal
				}

				var datas = {
					svcid : "searchLabel",
					url : "../account/select.do",			
					args : master
				}
				this.gfn_transaction(datas.url, datas, fn_callback);

			}

			/**
			 * param : datas, master
			 */
			this.fn_delete = function() {
				 
				var gubun_cd = document.getElementById('gubun').value;
				var inout_type = document.getElementById('inout_type').value;
				var input_year = document.getElementById('input_year').value;
				var input_month = document.getElementById('input_month').value;
				if (selectIDX == "") {
					alert("error");
				} else {
					
					
					if (input_month == 'none') {
						input_month='';
					} 
					
					var master = {
						"idx" : selectIDX,
						"inout_type" : inout_type, 
						"gubun_cd" : gubun_cd,
						"input_year" : input_year,
						"input_month" : input_month,
					}

					var datas = {
						svcid : "delete",
						url : "../account/delete.do",
						
						args : master
					}
					this.gfn_transaction(datas.url, datas, fn_callback);
					selectIDX = "";
				}
			}

			this.fn_update = function() {
				var gubun_cd = document.getElementById('gubun').value;
				var input_gubun_cd = document.getElementById('input_gubun').value;
				var inout_type = document.getElementById('inout_type').value;
				var input_date = document.getElementById('input_date').value;
				var input_year = document.getElementById('input_year').value;
				var input_month = document.getElementById('input_month').value;
				var contents = document.getElementById('contents').value;
				var input_value = document.getElementById('input_value').value;

				if (selectIDX == "") {
					alert("error");
				} else {
					
					if (input_month == 'none') {
						input_month='';
					} 
					
					var master = {
						"idx" : selectIDX,
						"gubun_cd" :gubun_cd, 
						"input_value" : input_value,
						"contents" : contents,
						"inout_type" : inout_type,
						"input_gubun_cd" : input_gubun_cd,
						"input_year" : input_year,
						"input_month" : input_month,
						"input_date" : input_date
					}

					var datas = {
						svcid : "update",
						url : "../account/update.do",
						args : master
					}
					this.gfn_transaction(datas.url, datas, fn_callback);
					selectIDX = "";
				}
			}

			this.fn_callback = function(svcid) {

				console.log("callback:" + svcid);

				switch (svcid) {
				case "delete":
					alert("삭제");
					break;
				case "searchLabel":
					update_chart();
					break;
				case "insert":

					//fn_select();
					break;
				case "init":
					
				/* 	$('ul.tab li').removeClass('current');
					$('.tabcontent').removeClass('current');
					$('ul.tab li').addClass('current');
					$('#' + selectedTab).addClass('current'); */
					//alert("call:"+selectedTab);
					//fn_select();
					break;
				}
			
			}

			$(function() {
				var option = {
					// datepicker 애니메이션 타입
					// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
					showAnim : "slideDown",
					// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
					showOtherMonths : true,
					// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
					selectOtherMonths : true,
					// 달력 밑에 오늘과 닫기 버튼이 보인다.
					showButtonPanel : true,
					// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
					changeMonth : true,
					changeYear : true,
					// 한번에 보이는 개월 수
					numberOfMonths : 3,
					// 데이터 포멧
					dateFormat : "yy-mm-dd",
					// 텍스트 박스 옆의 달력 포시
					showOn : "button",
					//이미지 타입인지 버튼 타입인지 설정
					buttonImageOnly : true,
					// 이미지 경로
					buttonImage : "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
					// 버튼 타입이면 버튼 값
					buttonText : "Select date",
					// alt 데이터 포멧
					altFormat : "DD, d MM, yy",
					// 선택 가능한 날짜(수 형식) - 현재 기준 -20일
					minDate : -20,
					// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
					maxDate : "+1M +20D",
					// 주 표시
					showWeek : true
				};
				var optionFrom = option;
				optionFrom.altField = "#alternateFrom";
				var dateFormat = "yy-mm-dd";
				// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
				var from = $("#from").datepicker(optionFrom).on("change",
						function() {

							to.datepicker("option", "minDate", getDate(this));
						});

				var optionTo = option;
				optionTo.altField = "#alternateTo";
				// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
				var to = $("#to").datepicker(optionTo).on("change", function() {
					from.datepicker("option", "maxDate", getDate(this));
				});
				function getDate(element) {
					return moment(element.value).toDate();
				}
			});

			var selectIDX = "";
			//테이블의 Row 클릭시 값 가져오기
			$("#example-table-1 tr")
					.click(
							function() {

								var str = ""
								var tdArr = new Array(); // 배열 선언

								// 현재 클릭된 Row(<tr>)
								var tr = $(this);
								var td = tr.children();

								// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
								console.log("클릭한 Row의 모든 데이터 : " + tr.text());

								// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
								td.each(function(i) {
									tdArr.push(td.eq(i).text());
								});

								console.log("배열에 담긴 값 : " + tdArr);

								// td.eq(index)를 통해 값을 가져올 수도 있다.
								var no = td.eq(0).text();
								var userid = td.eq(1).text();
								var name = td.eq(2).text();
								var email = td.eq(3).text();								
								var gubun_cd = td.eq(2).text();
								var input_value = td.eq(3).text();
								var contents = td.eq(4).text();
								var dt = td.eq(5).text();

								document.getElementById('input_value').value = input_value;
								
								document.getElementById('contents').value = contents;

								//수정 필요

								var sel = document
										.getElementById("input_gubun");

								for (var i = 0; i < sel.length; i++) {

									if (sel[i].text == gubun_cd) {

										sel[i].selected = true;
									}
								}

								document.getElementById('input_date').value = dt;

								selectIDX = userid;

								str += " * 클릭된 Row의 td값 = No. : <font color='red'>"
										+ no
										+ "</font>"
										+ ", 아이디 : <font color='red'>"
										+ userid
										+ "</font>"
										+ ", 이름 : <font color='red'>"
										+ name
										+ "</font>"
										+ ", 이메일 : <font color='red'>"
										+ email
										+ "</font>";

								/* $("#ex1_Result1").html(
										" * 클릭한 Row의 모든 데이터 = " + tr.text());
								$("#ex1_Result2").html(str); */
							});

			//----------------------------------------------------------------------------
			// 전체선택 및 해제 기능은..

			$('input[name=_selected_all_]').on('change', function() {
				$('input[name=_selected_]').prop('checked', this.checked);
			});

			//----------------------------------------------------------------------------
			// 선택한 Checkbox 값을 가져오는 방법은...

			var arr = $('input[name=_selected_]:checked').serializeArray().map(
					function(item) {
						return item.value
					});

			//var str = $('input[name=_selected_]:checked').serialize(); // 이건 QueryString 방식으로
		</script>
		<script type="text/javascript">
			// 차트		

			function update_chart() {

				config.data.datasets.splice(0, 1);

				var newDataset = {
					backgroundColor : [ "#f79546", "#9bba57", "#4f81bb",
							"#5f497a", "#a94069", "#ff5f34", "#41774e",
							"#003663", "#49acc5", "#c0504e"

					],
					data : [],
				}
				let labels = [];

				<c:forEach var="result" items="${sub_list}" varStatus="status">
				newDataset.data.push(Number("${result.sum}"));

				labels.push("${result.gubun_nm}");
				console.log("${result.gubun_nm}");
				</c:forEach>

				config.data.datasets.push(newDataset);
				config.data.labels = labels;

				window.myPie.update();

			}
			var config;
			window.onload = function() {

				config = {
					type : 'pie',
					data : {
						datasets : [ {
							data : [ 1, 2, 3, 4, 5

							],

							label : 'Dataset 1'
						} ],
						backgroundColor : [ "#f79546", "#9bba57", "#4f81bb",
								"#5f497a", "#a94069", "#ff5f34", "#41774e",
								"#003663", "#49acc5", "#c0504e"

						],

						labels : [ 'Red', 'Orange', 'Yellow', 'Green', 'Blue'

						]
					},
					options : {
						responsive : true,
						legend : false,

						pieceLabel : {
							render : 'value',
							position : 'outside',
							fontSize : 11,
							fontStyle : 'bold',
							fontColor : function(data) {
								var rgb = hexToRgb(data.dataset.backgroundColor[data.index]);
								var threshold = 140;
								var luminance = 0.299 * rgb.r + 0.587 * rgb.g
										+ 0.114 * rgb.b;
								return luminance > threshold ? 'black'
										: 'white';
							}

						}
					}
				};

				var ctx = document.getElementById('chart-area')
						.getContext('2d');
				window.myPie = new Chart(ctx, config);
				console.log("labels0:" + config.data.labels);
				update_chart();
			};
		</script>

		<script type="text/javascript">
			function btnView_Enc_Click(encParam) // 조회된 리스트 클릭 시 상세보기 팝업 호출
			{
				
			}

			function delete_row() {
				var my_tbody = document.getElementById('my-tbody');
			}

			function add_row() {
				var my_tbody = document.getElementById('my-tbody');
				// var row = my_tbody.insertRow(0); // 상단에 추가
				var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				cell1.innerHTML = ' 1';
				cell2.innerHTML = ' ';
				cell3.innerHTML = ' ';
				cell4.innerHTML = ' ';
			}

			// 탭 선택
			$(function() {
				$('ul.tab li').click(function() {
					var activeTab = $(this).attr('data-tab');
					
					selectedTab =activeTab;
					
					 if (activeTab == 'tab1') {
						fn_init('o');
					}
					else
					{
						fn_init('i');	
					}

				})
			});
		</script>


	</div>
</body>
</html>