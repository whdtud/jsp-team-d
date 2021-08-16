<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
h1{
	font-size:50px;
	text-align:center;
	color: white;
}
table{
	margin-left: auto; 
	margin-right: auto;
	border-top: 3px solid white; 
	border-bottom: 3px solid white; 
	height: auto;
	min-height: 400px;
	width:auto;
	min-width:800px;
	max-width:800px;
	color: white;
	border-collapse: collapse;
}
#nButton{
	margin-top: 10px;
	width: 45%; 
	margin-top:10px; 
	margin-right: auto; 
	margin-left: auto;
}
#nButton a{
	color: white;
}
#cud{
	float: right;
}
</style>
<script type= "text/javascript">
function del(no){
	if(confirm("삭제하시겠습니까?")){
		alert("삭제합니다.")
		location.href="./delete.do?no="+no;
	}
}
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/view/component/header.jsp" />
		</div>
		<div id="menu">
			<c:import url="/WEB-INF/view/component/menu.jsp" />
		</div>
		<div id="main">
			<div id="mainWrapper" style="width: 100%; margin:0;">
				<h1 id=head>${movie.movieNm }</h1>
				<table>
					<tr>
						<td style="height: 30px; min-height: 30px;">제목</td>
						<td style="margin-top: 10px; margin-bottom: 10px;">${movie.movieNm }번글&nbsp;:&nbsp;<c:out value="${movie.movieNm }" /></td>
					</tr>
					<tr>
						<td style="height: 30px; min-width: 70px;  min-height: 30px; margin-bottom: 10px;">감독</td>
						<td>${movie.directors }</td>
					</tr>
					
					<tr>
						<td style="height: 30px; min-height: 30px; margin-bottom: 10px;">날짜</td>
						<td>${movie.openDt}&emsp;&emsp;&emsp;&emsp;&emsp;영화유형&emsp;&emsp;${movie.typeNm }</td>
					</tr>
					
					<tr>
						<td colspan="2" style="width: 500px; border-top:3px solid white; text-align: center; min-height: 300px; height: 300px;">${movie.movieNm }</td>
					</tr>
					
				</table>
				<div id="nButton">  
					<dl style="text-align: center;">
						<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }" /> 
						<a href="list.do?pageNo=${pageNo }">[목록]</a>
					</dl> 
						
					<dl style="text-align: right; margin-bottom: 10px;">
						<c:if test="${authUser.id == 'admin' }">
							<a href="modify.do?no=${movie.movieCd }">[수정]</a>&emsp;
							<a onclick="return del(${movie.movieCd })" >[삭제]</a>
						</c:if>
					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>