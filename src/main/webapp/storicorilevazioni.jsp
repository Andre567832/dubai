<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"
	import="it.contrader.dto.ParametroDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Parametri Manager</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>

<div class="navbar">
  <a  href="homeadmin.jsp">Home</a>
  <a class="active" href="UserServlet?mode=userlist">Users</a>
  <a href="LogoutServlet" id="logout">Logout</a>
</div>
<div class="main">
	<%
		List<ParametroDTO> list = (List<ParametroDTO>)  request.getSession().getAttribute("storico");
	%>

<br>

	<table>
		<tr>
			<th>Battito cardiaco</th>
			<th>Saturazione</th>
			<th>Temperatura</th>
			<th>Stress</th>
			<th>Data</th>
			<th>Ora</th>
		</tr>
		<%
			for (ParametroDTO p : list) {
		%>
		<tr>
			<td><%=p.getBattito() %></td>
			<td><%=p.getSaturazione()%></td>
			<td><%=p.getTemperatura()%></td>
			<td><%=p.getStress()%></td>
			<td><%=p.getData()%></td>
			<td><%=p.getOra()%></td>

		</tr>
		<%
			}
		%>
	</table>

<%@ include file="../css/footer.jsp" %>
</body>
</html>