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
						type="button" value="삭제" onclick="fn_delete()" />
				</form>
			</div>

		</div>
		<div class="content">
			<div class="left_type2">
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
									<th scope="cols" width="150px">비고</th>
								</tr>
							</thead>

							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr class="row">
												<td><input type="checkbox" name="_selected"></td>
												<td style="display: none;">${row.seq }</td>
												<td>${row.main_cd }</td>
												<td>${row.cd_nm }</td>
												<td>${row.rmk }</td>
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
					<div class="sub_head">
						<div class="item">
							<i class="icon-expand-right">상세정보</i>
						</div>

					</div>

					<div class="table_wrap">
						<table class="type11" id="sub_table">
							<thead>
								<tr>
									<th scope="cols" width="25px">
									<th scope="cols" width="70px" style="display: none;">SEQ</th>
									<th scope="cols" width="150px">코드</th>
									<th scope="cols" width="150px">코드명</th>
									<th scope="cols" width="150px">코드값</th>
									<th scope="cols" width="150px">비고</th>

								</tr>
							</thead>

							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${fn:length(listd) > 0}">
										<c:forEach items="${listd }" var="row">
											<tr class="row">
												<td><input type="checkbox" name="_selected"></td>
												<td style="display: none;">${row.code_seq }</td>
												<td>${row.sub_cd }</td>
												<td>${row.cd_nm }</td>
												<td>${row.refcd1 }</td>
												<td>${row.refcd2 }</td>
												<td>${row.rmk }</td>
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

			<div class="right_type3">
				<div class="warp">
					<div class="sub_head">
						<div class="item">
							<i class="icon-expand-right">입력</i>
						</div>
					</div>
					<div class="table_wrap">
						<form>
							<table class="inputTable">
								<tr>
									<td style="width: 100px">코드</td>
									<td><input type="text" name="date" id="cd_h" size="12" />
									</td>
								</tr>
								<tr>
									<td style="width: 100px">코드명</td>
									<td><input type="text" name="cd_nm" id="cd_nm" size="12" />
									</td>
								</tr>
								<tr>
									<td style="width: 100px">코드값</td>
									<td><input type="text" name="cd_value" id="cd_value"
										size="12" /></td>
								</tr>

								<tr>
									<td style="width: 100px">비고</td>
									<td><input type="text" name="cd_value" id="cd_value"
										size="12" /></td>
								</tr>

							</table>
						</form>
						<div class="sub_head">
							<div class="item last">
								<form>
									<input type="button" value="추가" onclick="add_row()" /> <input
										type="button" value="삭제" onclick="fn_delete()" />
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script>
		var selectIDX = "";

		// 테이블의 Row 클릭시 값 가져오기
		$("#tableId tr").click(function() {

			var tr = $(this);
			var td = tr.children();
			selectIDX = td.eq(1).text();
			var main_cd = td.eq(2).text();

			console.log("idx:" + selectIDX + ",main_cd:" + main_cd);

			fn_selectItem(main_cd);
		});

		this.fn_select = function() {

			var marster = {}

			var datas = {
				svcid : "select",
				url : "../comm/selectCode.do",
				args : marster
			}

			this.gfn_transaction(datas.url, datas, fn_callback);

		}

		this.fn_delete = function() {

			var url = '../comm/delete.do';

			/* $('#sub_table tr').each(
					function() {

						var chk = $(this).eq(0).find('input[type="checkbox"]')
								.is(':checked');

						if (chk == true) {
							var fabric_seq = $(this).eq(0).eq(1);
							console.log("chk:" + chk + ", " + fabric_seq);
						}

					}); */
			if (selectIDX == "") {
				alert("error");
			} else {
				var marster = {
					"idx" : selectIDX
				}

				var datas = {
					svcid : "delete",
					url : "../comm/deleteCode.do",
					args : marster
				}
				this.gfn_transaction(datas.url, datas, fn_callback);
				selectIDX = "";
			}

		}

		this.fn_selectItem = function(obj1) {

			var marster = {
				"main_cd" : obj1
			}

			var datas = {
				svcid : "selectDetail",
				url : "../comm/selectCodeDetail.do",
				args : marster
			}

			this.gfn_transaction(datas.url, datas, fn_callback);
		}

		this.fn_insert = function() {
			var gubun = document.getElementById('input_gubun_type');

			var input_gubun_type = gubun.options[gubun.selectedIndex].value;
			var cd_h = document.getElementById('cd_h').value;
			var cd_nm = document.getElementById('cd_nm').value;
			var cd_value = document.getElementById('cd_value').value;
			var rmk = document.getElementById('rmk').value;

			//console.log("input_gubun_type:"+input_gubun_type);
			//console.log("input_date:"+input_date+", inout_type:"+inout_type+", contents:"+contents+", input_value:"+ input_value);

			var marster = {
				"cd_h" : cd_h,
				"cd_nm" : inout_type,
				"cd_value" : contents,
				"rmk" : rmk
			}

			var datas = {
				svcid : "insert",
				url : "../account/insert.do",
				args : marster
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
			case "searchLabel":

				break;
			case "insert":

				//fn_select();
				break;
			}
		}
	</script>
</body>
</html>