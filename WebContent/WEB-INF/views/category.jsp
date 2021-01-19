<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/table.css" />
<link rel="stylesheet" href="../css/layout2.css" />
<link rel="stylesheet" href="../css/fontello.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="../js/common.js"></script>
<style type="text/css">
table.inputTable2 {
	width: 100%;
	margin-top: 10px;
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
}

table.inputTable2 td {
	background: #eee;
}
</style>
</head>
<body>
	<div class="container">


		<!-- 상단 검색 영역 -->
		<div class="sub_head">
			<div class="item">
				<form>
					<select id="inout_type">
						<option value="o" 
								<c:if test="${inout_type == 'o'}">selected</c:if>>지출</option>
						<option value="i" 
								<c:if test="${inout_type == 'i'}">selected</c:if>>수입</option>
						
					</select> <label>메인코드</label> <input name="main_cd" type="text"> <label>코드명</label>

					<input name="code_nm" type="text">

				</form>
			</div>

			<div class="item last">
				<form>
					<input type="button" value="조회" onclick="fn_select()"> <input
						type="button" value="수정" onclick="fn_update()"> <input
						type="button" value="추가" onclick="fn_insert()" /> <input
						type="button" value="삭제" onclick="fn_delete()" />
				</form>
			</div>

		</div>

		<!--  상단 검색 영역 종료 -->


		<div class="content">
			<div class="left">
				<div class="warp">
					<i class="icon-expand-right">코드목록</i>
					<div class="table_wrap">

						<table class="type11" id="tableId">
							<thead>
								<tr>
									<th scope="cols" width="25px">
									<th scope="cols" width="70px" style="display: none;">SEQ</th>
									<th scope="cols" width="150px">코드</th>
									<th scope="cols" width="150px">코드명</th>
									<th scope="cols" width="150px" >Type</th>
									<th scope="cols" width="150px">대분류</th>
									<th scope="cols" width="150px">중분류</th>
									<th scope="cols" width="150px">소분류</th>
								</tr>
							</thead>

							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr class="row">
												<td><input type="checkbox" name="_selected"></td>
												<td style="display: none;">${row.seq }</td>
												<td>${row.gubun_cd }</td>
												<td>${row.gubun_nm }</td>
												<td>${row.inout_type }</td>
												<td>${row.item1 }</td>
												<td>${row.item2 }</td>
												<td>${row.item3 }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="right">
				<div class="warp">
					<div class="sub_head">
						<div class="item">
							<i class="icon-expand-right">입력</i>
						</div>
					</div>
					<div class="table_wrap">
							<table class="inputTable2" width="100%">
								<tr>
									<td>코 드</td> 
									<td><input type="text" name="gubun_cd" id="gubun_cd"
										size="12" /></td>
								</tr>
								<tr>
									<td>코드명</td>
									<td><input type="text" name="gubun_nm" id="gubun_nm"
										size="12" /></td>
								</tr>

								<tr>
									<td>Type</td>
									<td><select name="input_inout_type" id="input_inout_type"
										width=100%>
											<option value="o">지출</option>
											<option value="i">수입</option>
									</select></td>
								</tr>
								<tr>
									<td>대분류</td>
									<td><input type="text" name="item1" id="item1" size="12" /></td>
								</tr>

								<tr>
									<td>중분류</td>
									<td><input type="text" name="item2" id="item2" size="12" /></td>
								</tr>

								<tr>
									<td>소분류</td>
									<td><input type="text" name="item3" id="item3" size="12" /></td>
								</tr>

							</table>

					</div>

				</div>
			</div>
		</div>
	</div>
	<script>
		var gubun_cd = "";

		// 테이블의 Row 클릭시 값 가져오기
		$("#tableId tr").click(function() {

			var tr = $(this);
			var td = tr.children();
			gubun_cd = td.eq(2).text();
			var gubun_nm = td.eq(3).text();
			var inout_type= td.eq(4).text();
			var item1 = td.eq(5).text();
			var item2 = td.eq(6).text();
			var item3 = td.eq(7).text();

			console.log("gubun_cd:" + gubun_cd + ",gubun_nm:" + gubun_nm+", inout_type:"+inout_type+", item1:"+item1);
			
			document.getElementById('gubun_cd').value =gubun_cd;
			document.getElementById('gubun_nm').value =gubun_nm;
			
			var sel = document.getElementById("input_inout_type");

			for (var i = 0; i < sel.length; i++) {
		
				console.log("selectVal : " +sel[i].value+", val:"+inout_type);
				if (sel[i].value == inout_type) {
		
					sel[i].selected = true;
				}
			}
			
			
			document.getElementById('item1').value =item1;
			document.getElementById('item2').value =item2;
			document.getElementById('item3').value =item3;
			
		});
		
		
		this.fn_update = function() {
			
			var gubun_cd = document.getElementById('gubun_cd').value;
			var gubun_nm=document.getElementById('gubun_nm').value;
			var input_inout_type=document.getElementById('input_inout_type').value;
			var inout_type=document.getElementById('inout_type').value;
			var item1 = document.getElementById('item1').value;
			var item2 = document.getElementById('item2').value;
			var item3 = document.getElementById('item3').value;
			
			console.log("input_inout_type:"+input_inout_type);

			var master = {
					"gubun_cd":gubun_cd,
					"gubun_nm":gubun_nm,
					"inout_type":inout_type,
					"input_inout_type":input_inout_type,
					"item1":item1,
					"item2":item2,
					"item3":item3,
			}
			var datas = {
				svcid : "update",
				url : "../category/update.do",
				args : master
			}
			
			this.gfn_transaction(datas.url, datas, fn_callback);

		}

		this.fn_select = function() {

			var inout_type = document.getElementById('inout_type').value;
			
			console.log("inout_type:"+inout_type);
			
			var master = {
					'inout_type':inout_type
			}

			var datas = {
				svcid : "select",
				url : "../category/select.do",
				args : master
			}
			
			this.gfn_transaction(datas.url, datas, fn_callback);

		}

		this.fn_delete = function() {
			
			if (gubun_cd == "") {
				alert("error");
			} else {
				
				
				var inout_type = document.getElementById('inout_type').value;
				
				var master = {
					"gubun_cd" : gubun_cd,
					"inout_type" : inout_type
				}

				var datas = {
					svcid : "delete",
					url : "../category/delete.do",
					args : master
				}
				this.gfn_transaction(datas.url, datas, fn_callback);
				gubun_cd = "";
			}

		}

		this.fn_selectItem = function(obj1) {

			var master = {
				"main_cd" : obj1
			}

			var datas = {
				svcid : "selectDetail",
				url : "../category/selectDetail.do",
				args : master
			}

			this.gfn_transaction(datas.url, datas, fn_callback);
		}

		this.fn_insert = function() {
			
			var gubun_cd = document.getElementById('gubun_cd').value;
			var gubun_nm = document.getElementById('gubun_nm').value;			
			
			var input_inout_type = document.getElementById('input_inout_type').value;
			var inout_type = document.getElementById('inout_type').value;
			
			
			var item1 = document.getElementById('item1').value;
			var item2 = document.getElementById('item2').value;
			var item3 = document.getElementById('item3').value;
			
			console.log("inout_type:"+inout_type+"input_inout_type:"+input_inout_type+",item1:"+item1+",item2:"+item2+",item3:"+item3);
						

			var master = {
				"gubun_cd" : gubun_cd,
				"gubun_nm" : gubun_nm,				
				"input_inout_type" : input_inout_type,
				"inout_type" : inout_type,
				"item1" : item1,
				"item2" : item2,
				"item3" : item3
			}

			var datas = {
				svcid : "insert",
				url : "../category/insert.do",
				args : master
			}

			try {

				this.gfn_transaction(datas.url, datas, fn_callback);
			} catch (e) {
				alert(e.message);
			}

		}

		this.fn_callback = function(svcid) {
			console.log("callback:" + svcid);
			switch (svcid) {
			case "delete":
				alert("삭제");
				break;
			case "select":
				console.log("select");
				break;
			case "insert":

				//fn_select();
				break;
			}
		}
	</script>
</body>
</html>