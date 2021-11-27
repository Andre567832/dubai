<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="it.contrader.dto.BambinoDTO"
     import="it.contrader.dto.ParametroDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="/css/readbambino.css" rel="stylesheet">
</head>
<body>
<% //BambinoDTO bambino=(BambinoDTO)request.getSession().getAttribute("dto"); %>
<% ParametroDTO parametro =(ParametroDTO)request.getSession().getAttribute("dto"); %>
<div class="divPrincipale">
<h1 class="babyguard">BabyGuard</h1>
<button class="bottoneprova" style="margin-left: 80%"><a href="parametro/rileva?idbambino="<%=parametro.getIdbambino()%>>IL TUO BOTTONE</a></button>
<img alt="" src="https://media.istockphoto.com/vectors/baby-babbling-cute-baby-milestone-vector-id906874436?k=20&m=906874436&s=612x612&w=0&h=gzupGk4nAQgh6AGq-Q41bFlFwR0S4sct6CvEzCpCXe4=" class="imgPrincipale">
<div class="area"></div><nav class="main-menu">
            <ul>
                <li>
                    <a href="http://justinfarrow.com">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            Battito Cardiaco
                            <%=parametro.getBattito()%>
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="#">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Saturazione
                            <%=parametro.getSaturazione()%>
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="#">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Temperatura
                            <%=parametro.getTemperatura()%>
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="#">
                       <i class="fa fa-folder-open fa-2x"></i>
                        <span class="nav-text">
                            Peso
                            <%=parametro.getPeso()%>
                        </span>
                    </a>
                   
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-bar-chart-o fa-2x"></i>
                        <span class="nav-text">
                            Stress
                            <%=parametro.getStress()%>
                        </span>
                    </a>
                </li>
                
            </ul>
        </nav>
        
</div>
</body>
</html>