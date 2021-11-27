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
<body style="background-color: #6495ed ;">
<% //BambinoDTO bambino=(BambinoDTO)request.getSession().getAttribute("dto"); %>
<% int id = (Integer) request.getSession().getAttribute("id"); %>
<% int pannolino = (Integer) request.getSession().getAttribute("pannolino"); 
pannolino *= 10;%>
<div class="divPrincipale">
<div style="margin-left: 30%">
	<h1 class="babyguard">BabyGuard</h1>
</div>

<h1>Livello pannolino:  <%=pannolino%>%</h1>

<a href="/parametro/analisibambino?idbambino=<%=id%>">Torna indietro</a></button>


</body>
</html>