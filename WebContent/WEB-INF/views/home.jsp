<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/home.css" />
<link rel="stylesheet" href="../css/layout.css" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">

html, body {
	height: 100%;
}

.container {
	display: flex;
	flex-direction: column;
	padding: 0;
	height: 100%;
}

.content {
	display: flex;
	height: 100%;
}

header {
	border-bottom: solid 1px gray;
}

nav {
	flex-basis: 150px;
	flex-shrink: 0;
	border-right: solid 1px gray;
}

main {
	width: 100%;
	padding: 10px;
}

footer {
	border-top: solid 1px gray;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
		$(document).ready(function(e) {
			/* a요소를 클릭 했을 시 */
			$('a').click(function() {
				/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */
				$('#iframe').attr('src', $(this).attr('data-url'));
			})
		});
	</script>
</head>
<body>

	<div class="container">
		<header>
		<div align="right">
		<c:choose>
			    <c:when test="${sessionScope.loginCheck eq true}">
	        		${sessionScope.id} 님이 로그인 되었습니다.  
	        		<button type="submit" id="btnLogout" onclick="fn_select()">logout</button>
	    		</c:when>	
	    		<c:otherwise>로그인해야합니다.</c:otherwise>	
		</c:choose>
		</div>

		</header>

		<section class="content"> <nav>
		<ul class="mylist">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="prt">
						<li><a data-url='${prt.pg_src}' class="link_find">${prt.pg_nm_eng}</a></li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li><a data-url='../account/in.do' class="link_find">INCOME</a></li>
					<li><a data-url='../account/out.do' class="link_find">OUTCOME</a></li>
					<li><a data-url='../api/monitor.do' class="link_find">DEBICE</a></li>
					<li><a data-url='../comm/code.do' class="link_find">Code관리</a></li>
					<li><a data-url='../account/static.do' class="link_find">Static</a></li>
					<li><a data-url='../member/member.do' class="link_find">MEMBER</a></li>
					<li><a data-url='../system/program.do' class="link_find">PROGRAM</a></li>
				</c:otherwise>
			</c:choose>
		</nav> <main> <iframe id="iframe" frameborder="0" marginwidth="0"
			width="100%" height="100%" src=""> </iframe> </main> </section>

		<footer> Footer </footer>
	</div>
</body>
<script type="text/javascript">
this.fn_select = function() {
	window.location.href = '../member/logout.do';
}


</script>
</html>