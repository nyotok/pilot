<%@page contentType="text/html; charset=utf8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page
	import="com.ctb.pilot.chat.model.*,com.ctb.pilot.chat.dao.*,com.ctb.pilot.chat.dao.jdbc.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/database.jsp"%>
<fmt:bundle basename="chat">
	<fmt:message var="title" key="TITLE" />
	<fmt:message var="nickname" key="NICKNAME" />
	<fmt:message var="message" key="MESSAGE" />
	<fmt:message var="time" key="TIME" />
	<fmt:message var="maxRowCount" key="MAX_ROW_COUNT" />
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--
<meta http-equiv="refresh" content="10">
-->
<title>${title}</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="chat.js"></script>
<link rel="stylesheet" type="text/css" href="../common/css/common.css" />
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");

		int userSequence = user.getSequence();
		String nickname = user.getNickname();

		String rowCount = request.getParameter("row_count");
		if (rowCount == null || rowCount.isEmpty()) {
			rowCount = "100";
		}

		MessageDao messageDao = new JdbcMessageDao();
	%>
	<form method="post" action="send_message.jsp" name="chat" id="chat">
		<table>
			<tr>
				<td>${nickname}:</td>
				<%
					out.println("<td>" + nickname + "</td>");
				%>
				<td></td>
			</tr>
			<tr>
				<td>${message}:</td>
				<td><input type="text" name="message" id="message" size=100 /></td>
				<td><input type="button" value="Send" onClick="emptyChk()" /></td>
			</tr>
		</table>
	</form>
	<br>
	<table border="1">
		<tr>
			<th width="200">${time}</th>
			<th width="100">${nickname}</th>
			<th width="700">${message}</th>
		</tr>
		<%
			List<Message> messageList = messageDao
					.getMessagesWithRowCount(Integer.parseInt(rowCount));
		%>
		<c:set var="messages" value="<%=messageList%>"></c:set>
		<c:forEach var="message" items="${messages}">
			<tr>
				<td><fmt:formatDate value="${message.createdTime}" type="both"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${message.nickname}</td>
				<td>${message.message}</td>
			</tr>
		</c:forEach>
	</table>
	<br> ${maxRowCount}:
	<%
 	out.println("<input type=\"text\" name=\"row_count\" id=\"row_count\" value=\""
 			+ rowCount + "\"/>");
 %>
</body>
</html>