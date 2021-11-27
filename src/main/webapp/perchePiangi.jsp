<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="it.contrader.dto.BambinoDTO"
     import="it.contrader.dto.ParametroDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BABYGUARD</title>
<link href="/css/readbambino.css" rel="stylesheet">
</head>
<body class="img">
<% //BambinoDTO bambino=(BambinoDTO)request.getSession().getAttribute("dto"); %>
<% int id = (Integer) request.getSession().getAttribute("id"); %>
<% String motivi = (String) request.getSession().getAttribute("motivi"); %>
<div class="divPrincipale">
<div style="margin-left: 30%">
	<h1 class="babyguard">BabyGuard</h1>
</div>

<h2><%=motivi%></h2>

<a href="/parametro/analisibambino?idbambino=<%=id%>">Torna indietro</a></button>


</body>
</html>