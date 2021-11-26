package it.contrader.controller;

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

@Controller
@RequestMapping("/parametro")
public class ParametroController {
	
	@Autowired
	private ParametroService service;

	
	
	private ParametroDTO rilevazione(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		
		return new ParametroDTO();
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
	
	private void checktemperaturaesterna(HttpServletRequest request, double temperaturaest) {
		if(temperaturaest < 10) {
			request.getSession().setAttribute("alerttemp", "L'ambiente è troppo freddo");
		} else if(temperaturaest  > 20) {
			request.getSession().setAttribute("alerttemp", "L'ambiente è troppo caldo");
		}
	}
	
	private void checksaturazione(HttpServletRequest request, double saturazione) {
		if(saturazione < 94.1) {
			request.getSession().setAttribute("alertsaturazione", "Saturazione bassa, controlla se il bambino sta respirando!!");
		} 
	}

	private void checkpannolino(HttpServletRequest request, boolean pannolino) {
		if(pannolino) {
			request.getSession().setAttribute("alert", "Il pannolino va cambiato");
		} 
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
	
	private void checkbattiti(HttpServletRequest request, int battiti) {
		if(battiti < 85) {
			request.getSession().setAttribute("alertbattiti", "La frequenza cardiaca è troppo bassa");
		} else if(battiti > 170) {
			request.getSession().setAttribute("alertbattiti", "La frequenza cardiaca è troppo alta");
		}
	}



	private void checktemperatura(HttpServletRequest request, double temperatura) {
		if(temperatura < 35) {
			request.getSession().setAttribute("alertclima", "La temperatura è troppo bassa");
		} else if(temperatura > 37) {
			request.getSession().setAttribute("alertclima", "La temperatura è troppo alta, il bambino ha la febbre");
		}
	}


	@GetMapping("/storico")
	public String storico(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		request.getSession().setAttribute("storico", service.findByIdbambino(idbambino));
		return "storicorilevazioni";
	}


}
