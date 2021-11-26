<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="it.contrader.dto.PiattoDTO"
    import="it.contrader.dto.UserDTO"
    import="it.contrader.util.Carrello"
    import="java.util.List"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Il tuo carrello</title>
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
<br>

<div class="main">
<%List<PiattoDTO> cart = (List<PiattoDTO>) request.getSession().getAttribute("cart");%>


	<table>
		<tr>
			<th>Piatto</th>
			<th>Prezzo</th>
			<th></th>
			<th></th>
		</tr>
		<%
			for (PiattoDTO p : cart) {
		%>
		<tr>
			<td><%=p.getNomePiatto()%></td>
			<td><%=p.getPrezzo()%></td>
			<td><a href="/carrello/removecart?idpiatto=<%=p.getIdpiatto()%>">Rimuovi</a>
			</td>

		</tr>
		<%
			}
		%>
	</table>

 <a href="/carrello/confirmcart"><button>Conferma e acquista</button></a>
	



</div>

<%@ include file="../css/footer.jsp" %>
</body>
</html>