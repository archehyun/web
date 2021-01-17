<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/grid.css" />

</head>
<body>
	
	<div class="sub-container">
	
	1
	<!--  
		<div class="item1">
		
			<form name="input" method="post" action="./account.do">
				<select name="type" id="type">
					<option value="in">IN</option>
					<option value="out">OUT</option>
				</select> <select name="gubun" id="gubun">
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
				</select>
				<input type="submit" value="조회">
				<input type="submit" value="추가" >
			</form>
		</div>


		<div class="item3" style="overflow-x: auto;">
		
			<div class="warraper">
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
			</div>
		</div>


		<div class="item4">
			상세 내용1
			<table class="inputTable">
				<tr>
					<td>Gubun</td>
					<td><input type="text" name="my_name" size="20"></td>
				</tr>
				<tr>
					<td>Type</td>
					<td><input type="text" name="my_name" size="20"></td>
				</tr>
				<tr>
					<td>Contents</td>
					<td><input type="text" name="my_name" size="20"></td>
				</tr>
				<tr>
					<td>Value</td>
					<td><input type="text" name="my_name" size="20"></td>
				</tr>
			</table>

		</div>
		 -->
	</div>
</body>
</html>