<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.contrader.dto.OrdineDTO"
    import="java.time.LocalDate"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Read Ordine</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>


<br>

<div class="main">
<%OrdineDTO o = (OrdineDTO) request.getSession().getAttribute("dto");%>


<table>
	<tr> 
		<th>piattoOrdinato</th>
		<th>prezzo</th>
		<th>data</th>
		<th>iduser</th>
		<th>idristorante</th>
	</tr>
	<tr>
		<td><%=o.getPiattoOrdinato()%></td>
		<td> <%=o.getPrezzoFisso()%></td>
		<td> <%=o.getData()%></td>
		<td> <%=o.getIduser()%></td>
		<td> <%=o.getIdristorante()%></td>
		<% System.out.println(o.getData()); %>
	</tr>	
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