<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List"
    import="it.contrader.dto.BambinoDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/home.css" rel="stylesheet">
<title>User Manager</title>
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
        List<BambinoDTO> bambini = (List<BambinoDTO>) request.getSession().getAttribute("list");
    %>

<br>


	<table>
		<tr>
			<th>Bambino</th>
			<th>Opzioni</th>
		</tr>
		<%
			for (BambinoDTO b : bambini) {
		%>
		<tr>
			<td>
					<%=b.getNome()%>
			</td>
			<td><a href=/parametro/analisibambino?idbambino=<%=b.getIdbambino()%>>Analisi</a>
			</td>
			<td><a href=/bambino/delete?id=<%=b.getIdbambino()%>>Delete</a>
			</td>

		</tr>
		<%
			}
		%>
	</table>
	
	
	
</body>
</html>