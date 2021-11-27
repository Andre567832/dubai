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
<% ParametroDTO parametro =(ParametroDTO)request.getSession().getAttribute("dto"); %>
<div class="divPrincipale">
<div style="margin-left: 30%">
	<h1 class="babyguard">BabyGuard</h1>
</div>

<div class="divBottoni" >
<button class="bottoneprova" ><a href="/parametro/rileva?idbambino=<%=parametro.getIdbambino()%>">Quanto peso</a></button>
<button class="bottoneprova" ><a href="/parametro/rileva?idbambino=<%=parametro.getIdbambino()%>">Dimmi perche piangi</a></button>
<button class="bottoneprova" ><a href="/parametro/rileva?idbambino=<%=parametro.getIdbambino()%>">Misurami la frebre</a></button>
<button class="bottoneprova" ><a href="/parametro/rileva?idbambino=<%=parametro.getIdbambino()%>">Controllami il pannolino</a></button>
</div>

<div class="divImg">
<img alt="" src="https://media.istockphoto.com/vectors/baby-babbling-cute-baby-milestone-vector-id906874436?k=20&m=906874436&s=612x612&w=0&h=gzupGk4nAQgh6AGq-Q41bFlFwR0S4sct6CvEzCpCXe4=" class="imgPrincipale">
</div>
<nav class="main-menu">
            <ul>
                <li>
                    <a href="http://justinfarrow.com">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            Battito Cardiaco
                            <br>   
                           <h1 class="parametri"><%=parametro.getBattito()%> </h1>
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="#">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Saturazione
                            <br>   
                           <h1 class="parametri"><%=parametro.getSaturazione()%> </h1>
                       
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="#">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Temperatura
                             <br>   
                           <h1 class="parametri temperatura"><%=parametro.getTemperatura()%> </h1>
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="#">
                       <i class="fa fa-folder-open fa-2x"></i>
                        <span class="nav-text" style="">
                            Peso
                             <br>   
                           <h1 class="parametri"><%=parametro.getPeso()%> </h1>
                           
                        </span>
                    </a>
                   
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-bar-chart-o fa-2x"></i>
                        <span class="nav-text">
                            Stress
                             <br>   
                           <h1 class="parametri"><%=parametro.getStress()%> </h1>
                           
                        </span>
                    </a>
                </li>
                
            </ul>
        </nav>
        <script >
			let temperatura=document.querySelector(".temperatura");
			console.log(temperatura.textContent);
			let prova=parseFloat(temperatura.textContent);
			if(prova>=32.0){
				alert("Il bambino ha la temperatura alta");
			}
		</script>
		
</div>
</body>
</html>