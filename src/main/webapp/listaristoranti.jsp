<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"
	import="it.contrader.dto.RistoranteDTO"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Lista Ristoranti</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>

<div class="navbar">
  <a href="/homeuser.jsp">Home</a>
  <a href="/ristorante/ristorantilist">Ristoranti</a>
  <a href="/carrello/readcart">Carrello</a>
  <a href="/ordine/ordiniuserlist">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<div class="main">
	<%
		List<RistoranteDTO> list = (List<RistoranteDTO>) request.getAttribute("list");
	%>

<br>

	<table>
		<tr>
			<th>Nome del ristorante</th>
			
		</tr>
		<%
			for (RistoranteDTO r : list) {
		%>
		<tr>
			<td><a href="/ristorante/read?idristorante=<%=r.getIdristorante()%>"s>
					<%=r.getNome()%>
			</a></td>

		</tr>
		<%
			}
		%>
	</table>



</div>
<br>
<%@ include file="../css/footer.jsp" %>
</body>
</html>