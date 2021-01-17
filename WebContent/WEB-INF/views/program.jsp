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
<link rel="stylesheet" href="../css/layout2.css" />
<link rel="stylesheet" href="../css/fontello.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="../js/common.js"></script>
<style type="text/css">
.right {
	flex-basis: 300px;
	flex-shrink: 0;
}

.left {
	width: 100%;
	padding-right: 10px;
}

.warp {
	height: 96%;
}

.content {
	height: 100%;
}
</style>
</head>
<body>

	<div class="container">
		<div class="sub_head">
			<div class="item">
				<form>
					<label>메인코드</label> <input name="main_cd" type="text"> <label>코드명</label>
					<input name="code_nm" type="text"> 
				</form>
			</div>
			<div class="item last">
				<form>
				<input type="button" value="조회" onclick="fn_select()">
					<input type="button" value="추가" onclick="fn_insert()" /> 
					<input type="button" value="수정" onclick="fn_update()" />
					<input	type="button" value="삭제" onclick="fn_delete()" />
				</form>
			</div>

		</div>
		<div class="content">
			<div class="left">
				<div class="warp">
				<i class="icon-expand-right">	프로그램 목록</i>
					<div class="table_wrap">
						<table class="type11" id="tableId">
							<thead>
								<tr>
									<th scope="cols" width="25px">
									<th scope="cols" width="70px">프로그램 ID</th>
									<th scope="cols" width="150px">프로그램 명</th>
									<th scope="cols" width="150px">영문명</th>
									<th scope="cols" width="150px">프로그램 SRC</th>
									
								</tr>
							</thead>

							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr class="row">
												<td><input type="checkbox" name="_selected"></td>
												<td>${row.pg_id }</td>
												<td>${row.pg_nm }</td>
												<td>${row.pg_nm_eng }</td>
												<td>${row.pg_src }</td>
												
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

					</div>
				</div>
			</div>
			<div class="right">
				<div class="wrap">
					<i class="icon-expand-right">상세정보</i>
					<div class="table_wrap">
							<table class="inputTable">
								<tr>
									<td>프로그램ID</td>
									<td><input type="text"  id="pg_id" size="12" /></td>
								</tr>

								<tr>
									<td>프로그램명</td>
									<td><input id="pg_nm" type="text"  size="20"></td>
								</tr>

								<tr>
									<td>SRC</td>
									<td><input id="pg_src" type="text" size="20"></td>
								</tr>
								<tr>
									<td>영문명</td>
									<td><input id="pg_nm_eng" type="text"  size="20"></td>
								</tr>

							</table>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	
	
	
	/*********************************
	User Define Method
	
	*********************************/
	$("#tableId tr")
	.click(
			function() {

				var str = ""
				var tdArr = new Array(); // 배열 선언

				// 현재 클릭된 Row(<tr>)
				var tr = $(this);
				var td = tr.children();
				
				
				var pg_id 			= td.eq(1).text();
				var pg_nm 		= td.eq(2).text();
				var pg_nm_eng = td.eq(3).text();	
				var pg_src 		= td.eq(4).text();

				document.getElementById('pg_id').value = pg_id;
				document.getElementById('pg_nm').value = pg_nm;
				document.getElementById('pg_src').value = pg_src;		
				document.getElementById('pg_nm_eng').value = pg_nm_eng;

			});
	
	
	/******
	common method
	1. fn_select
	2. fn_inert
	3. fn_update
	4. fn_delete
	5. fn_callback
	*/
	
	/*********************************
	 1. fn_select 
	- marster  
	- datas	  
	**********************************/
	this.fn_select = function() {
		
		
		
		var marster = {

				
			}

			var datas = {
				svcid : "search",
				url : "../system/program.do",			
				args : marster
			}
			this.gfn_transaction(datas.url, datas, fn_callback);
		
		
		
		

	}
	/*********************************
	 2. fn_insert method 
	- marster  
	   : pg_id
	   : pg_nm
	   : prg_src
	   : pg_nm_eng
	  
	- datas	  
	**********************************/
	
	this.fn_insert = function() {
		   
		var pg_id = document.getElementById('pg_id').value;
		var pg_nm = document.getElementById('pg_nm').value;
		var pg_src = document.getElementById('pg_src').value;
		var pg_nm_eng =  document.getElementById('pg_nm_eng').value;
		   
		
		var master = {
			"pg_id":pg_id,
			"pg_nm":pg_nm,
			"pg_src":pg_src,
			"pg_nm_eng":pg_nm_eng
		}
		console.log("pg_nm:"+pg_nm);

		var datas = {
			svcid : "insert",
			url : "../system/insert.do",			
			args : master
		}
		this.gfn_transaction(datas.url, datas, fn_callback);

	}
	/*********************************
	 2. fn_insert method 
	- marster  
	   : pg_id
	   : pg_nm
	   : prg_src
	   : pg_nm_eng
	  
	- datas	  
	**********************************/
	
	this.fn_update = function() {
		   
		var pg_id = document.getElementById('pg_id').value;
		var pg_nm = document.getElementById('pg_nm').value;
		var pg_src = document.getElementById('pg_src').value;
		var pg_nm_eng =  document.getElementById('pg_nm_eng').value;
		
		if (pg_id == "") {
			alert("error");
			return;
		}
		
		   
		
		var master = {
			"pg_id":pg_id,
			"pg_nm":pg_nm,
			"pg_src":pg_src,
			"pg_nm_eng":pg_nm_eng
		}

		var datas = {
			svcid : "update",
			url : "../system/update.do",			
			args : master
		}
		this.gfn_transaction(datas.url, datas, fn_callback);

	}
	
	this.fn_delete = function() {
		   
		var pg_id = document.getElementById('pg_id').value;
		
		if (pg_id == "") {
			alert("error");
			return;
		}
		   
		
		var master = {
			"pg_id":pg_id
			
		}

		var datas = {
			svcid : "update",
			url : "../system/delete.do",			
			args : master
		}
		this.gfn_transaction(datas.url, datas, fn_callback);

	}
	
	this.fn_callback = function(svcid) {

		console.log("callback:" + svcid);

		switch (svcid) {
		case "delete":
			alert("삭제");
			break;
		case "searchLabel":
			//update_chart();
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
	
	
	
	</script>


	</div>

</body>
</html>