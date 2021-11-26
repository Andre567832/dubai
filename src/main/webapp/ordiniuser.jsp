<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List" import="it.contrader.dto.OrdineDTO"
    import="java.time.LocalDate"
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Ordini User</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
<div class="navbar">
  <a href="/homeuser.jsp">Home</a>
  <a href="/ristorante/ristorantilist">Ristoranti</a>
  <a href="/carrello/readcart">Carrello</a>
  <a class="active" href="/ordine/ordiniuserlist">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<br>

<div class="main">
	<%
		List<OrdineDTO> list = (List<OrdineDTO>) request.getAttribute("ordini");
	%>

<br>

	<table>
		<tr>
			<th>piattoOrdinato</th>
			<th>prezzo</th>
			<th>data</th>
			
			<th></th>
			<th></th>
		</tr>
		<%
			for (OrdineDTO o : list) {
		%>
		<tr>
			<td><%=o.getPiattoOrdinato()%></td>
			<td><%=o.getPrezzoFisso()%></td>
			<td><%=o.getData()%></td>
			
			<%//System.out.println(o.getData());%></td>
			<td></td>
			<td></td>

		</tr>
		<%
			}
		%>
	</table>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


</div>

<%@ include file="../css/footer.jsp" %>
</body>
</html>