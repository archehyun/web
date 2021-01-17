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

</style>


</head>
<body>
	<div class="container">
		<div class="sub_head">
			<div class="item">
				<form>
					<label>메인코드</label> <input name="main_cd" type="text"> <label>코드명</label>
					<input name="code_nm" type="text"> <input type="submit"
						value="조회" onclick="fn_select()">
				</form>
			</div>
			<div class="item last">
				<form>
					<input type="button" value="추가" onclick="add_row()" /> <input
						type="button" value="삭제" onclick="add_row()" />
				</form>
			</div>
		</div>
		<div class="content">
			<div class="left_type2">
				<div class="warp">
				<i class="icon-expand-right">	코드목록</i>
					<div class="table_wrap">

						<table class="type11" id="tableId">
							<thead>
								<tr>
									<th scope="cols" width="25px">
									<th scope="cols" width="70px">사용자 ID</th>
									<th scope="cols" width="150px">사용자 명</th>
									<th scope="cols" width="150px">사용자 그룹</th>
								</tr>
							</thead>

							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr class="row">
												<td><input type="checkbox" name="_selected"></td>
												<td>${row.mem_id }</td>
												<td>${row.mem_nm }</td>
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
			<div class="right_type2">
				<div class="warp">
					<i class="icon-expand-right">상세정보</i>
					<div class="table_wrap">
						<table class="type11">
							<thead>
								<tr>
									<th scope="cols" width="25px">
									<th scope="cols" width="150px">프로그램 ID</th>
									<th scope="cols" width="150px">프로그램 명</th>
									<th scope="cols" width="150px">프로그램 영문명</th>

								</tr>
							</thead>

							<tbody id="my
								-tbody">

								<c:choose>
									<c:when test="${fn:length(listd) > 0}">
										<c:forEach items="${listd }" var="row">
											<tr class="row">
												<td><input type="checkbox" name="_selected"></td>
												<td>${row.pg_id }</td>
												<td>${row.pg_nm }</td>
												<td>${row.pg_nm_eng }</td>
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
				</div>
			</div>
		</div>
	</div>
	<script>
		// 테이블의 Row 클릭시 값 가져오기
		
		
		$("#tableId tr").click(function() {

			var tr = $(this);
			var td = tr.children();
			var mem_id = td.eq(1).text();
			console.log("mem_id:" + mem_id);
			fn_select_detail("mem_id", mem_id);
			
			
		});
		
		this.fn_insertDetail = function()
		{
			
			
		}
		

		this.fn_select = function() {

			var gubun_type = document.getElementById('type_c').value;
			var datas =  {
					 svcid : "searchLabel",
					url:"../member/select.do",
					name:"inout_type",
					value:gubun_type
			}

		}

		
		this.fn_select_detail = function(varName, varValue) {
		console.log("select_detail");
		
		
		var marster = {
				"mem_id":varValue
			}
			
			var datas =  {
					 svcid : "searchDetail",
					url:"../member/selectDetail.do",					
					args : marster
			}
			this.gfn_transaction(datas.url, datas, fn_callback);

		}
		
		this.fn_callback= function(svcid)
		{
			switch(svcid) 
			{
			case "delete":
				//fn_select();
				break;
			case "searchLabel":
				//fn_select();
				break;
			case "insert":
				//fn_select();
				break;	
			}
		}
		
		

		this.fn_selectItem = function() {
			var url = '../comm/code.do';
			window.location.href = url;
		}
	</script>
</body>
</html>