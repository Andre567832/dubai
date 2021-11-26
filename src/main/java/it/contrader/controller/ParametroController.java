package it.contrader.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;
import java.util.stream.DoubleStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import it.contrader.dto.ParametroDTO;
import it.contrader.dto.UserDTO;
import it.contrader.service.BambinoService;
import it.contrader.service.ParametroService;


/**
 * @author Edoardo Rosiello
 */
@Controller
@RequestMapping("/parametro")
public class ParametroController {
	
	@Autowired
	private ParametroService service;

	
	
	private ParametroDTO rilevazione(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		
		Random r = new Random();
	//	r.doubles(3.5, 4.5);
		double peso = r.nextDouble() + 2.5 + r.nextDouble();
		int battito = r.nextInt(150) + 50;
		int saturazione = r.nextInt(10) + 90;
		double temperatura = r.nextInt(4) + 34;
		boolean pannolino = r.nextInt(4) > 2;
		double stress;
		controllastress(request, battito, saturazione, temperatura, pannolino);
		LocalDate data = LocalDate.now();
		LocalTime time = LocalTime.now();
		return new ParametroDTO();
	}
	
	
	private void controllastress(HttpServletRequest request, int battito, int saturazione, double temperatura, boolean pannolino) {
		int g =0;
		if(!checkbattiti(request, battito)) g++;
		if(!checkpannolino(request, pannolino)) g++;
		if(!checktemperatura(request, temperatura)) g++;
		if(!checksaturazione(request, saturazione)) g++;
		
		double stress;
		Random r = new Random();
		switch(g) {
		
		
		case 1:
			stress = r.nextDouble()*40;
			break;
		case 2:
			stress = r.nextDouble()*70;
			break;
		case 3:
			stress = r.nextDouble()*90;
			break;
		case 4:
			stress = r.nextDouble()*100;
			break;
			
		default:
			stress = 0;
			break;
		}
	}


	@GetMapping("/nomemancante")
	public String read(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		request.getSession().setAttribute("dto", service.read(idbambino));
		return "readbambino";
	}
	
	
	@PostMapping("/rileva")
	public String rileva(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		rilevazione(request, idbambino);
		return "readbambino";
	}
	
	
	@GetMapping("/gettemperatura")
	public String rilevaTemperatura(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		rilevazione(request, idbambino);
		double temperatura = ((ParametroDTO)(request.getSession().getAttribute("dto"))).getTemperatura();
		checktemperatura(request, temperatura);
		return "readbambino";
	}
	
	@GetMapping("/gettemperaturaest")
	public String rilevaTemperaturaEsterna(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		//Prendi random temp est
		double temperaturaest = 1.0;
		checktemperaturaesterna(request, temperaturaest);
		return "readbambino";
	}
	
	private boolean checktemperaturaesterna(HttpServletRequest request, double temperaturaest) {
		if(temperaturaest < 10) {
			request.getSession().setAttribute("alerttemp", "L'ambiente è troppo freddo");
			return false;
		} else if(temperaturaest  > 20) {
			request.getSession().setAttribute("alerttemp", "L'ambiente è troppo caldo");
			return false;
		}
		else return true;
	}
	
	private boolean checksaturazione(HttpServletRequest request, double saturazione) {
		if(saturazione < 94.1) {
			request.getSession().setAttribute("alertsaturazione", "Saturazione bassa, controlla se il bambino sta respirando!!");
			return false;
		} 
		return true;
	}

	private boolean checkpannolino(HttpServletRequest request, boolean pannolino) {
		if(pannolino) {
			request.getSession().setAttribute("alert", "Il pannolino va cambiato");
			return false;
		} 
		return true;
	}

	@GetMapping("/getbattiti")
	public String rilevaBattiti(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		rilevazione(request, idbambino);
		int battiti = ((ParametroDTO)(request.getSession().getAttribute("dto"))).getBattito();
		checkbattiti(request, battiti);
		return "readbambino";
	}
	
	@GetMapping("/getpeso")
	public String rilevaPeso(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		rilevazione(request, idbambino);
		double peso = ((ParametroDTO)(request.getSession().getAttribute("dto"))).getPeso();
		return "readbambino";
	}
	
	private boolean checkbattiti(HttpServletRequest request, int battiti) {
		if(battiti < 85) {
			request.getSession().setAttribute("alertbattiti", "La frequenza cardiaca è troppo bassa");
			return false;
		} else if(battiti > 170) {
			request.getSession().setAttribute("alertbattiti", "La frequenza cardiaca è troppo alta");
			return false;
		}
		return true;
	}



	private boolean checktemperatura(HttpServletRequest request, double temperatura) {
		if(temperatura < 35) {
			request.getSession().setAttribute("alertclima", "La temperatura è troppo bassa");
			return false;
		} else if(temperatura > 37) {
			request.getSession().setAttribute("alertclima", "La temperatura è troppo alta, il bambino ha la febbre");
			return false;
		}
		return true;
	}


	@GetMapping("/storico")
	public String storico(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		request.getSession().setAttribute("storico", service.findByIdbambino(idbambino));
		return "storicorilevazioni";
	}


}
