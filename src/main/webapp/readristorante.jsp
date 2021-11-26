<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="it.contrader.dto.RistoranteDTO"
    import="it.contrader.dto.PiattoDTO"
    import= "java.util.ArrayList"
	import= "java.util.List"
    
  	%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Ristoranti</title>
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
<% 	RistoranteDTO r = (RistoranteDTO) request.getAttribute("ristorante");
	List<PiattoDTO> listapiatti = (List<PiattoDTO>) request.getAttribute("list");
%>

	<table>
		<tr>
			<th>Piatti</th>
			<th>Prezzo</th>
			<th>Opzioni</th>
		</tr>
		
		<%
		for (PiattoDTO p : listapiatti) {
			if(p.isStato()){
		%>
		<tr>
			<td><%=p.getNomePiatto()%></td>
			<td><%=p.getPrezzo()%></td>
			
			<td><a href="/carrello/addcart?idpiatto=<%=p.getIdpiatto()%>">Aggiungi al carrello</a>
			</td>

		</tr>
		<%
			}
		}
		%>
	</table>
		
		
</div>

<%@ include file="../css/footer.jsp" %>

		
		
</body>
</html>