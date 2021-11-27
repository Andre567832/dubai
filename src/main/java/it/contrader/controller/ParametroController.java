package it.contrader.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.stream.DoubleStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
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
import it.contrader.service.PiantoService;


/**
 * @author Edoardo Rosiello
 */
@Configuration
@EnableAsync
@EnableScheduling
@Controller
@RequestMapping("/parametro")
public class ParametroController {
	
	@Autowired
	private ParametroService service;
	
	@Autowired
	private BambinoService bambinoservice;
	@Autowired
	private PiantoService piantoservice;

/*
	public void init(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {

        Timer timer = new Timer();
	        timer.scheduleAtFixedRate(new TimerTask() {
	       
           public void run() {
		                             System.out.println("Processor starts running");
		             

	                 rilevazione(request, idbambino);

		           
		         }}, 0, 1000 * 4);//  The setting here will delay the fixed execution every day
		     }
	*/
/*
	private void rilevazioneAutomatica(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		
		Timer t = new Timer();
		
		t.scheduleAtFixedRate(getrilevazione(request, idbambino), (long) 1000, (long) 4 * 1000);
		
	}
	
	private TimerTask getrilevazione(HttpServletRequest request, int idbambino) {
		TimerTask t = new TimerTask() {
			
			@Override
			public void run() {
				System.out.println("qui entra");
				rilevazione(request, idbambino);
			}
		};
		return t;
	}

*/
	private void rilevazione(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		System.out.println("anche qui");
		Random r = new Random();
	//	r.doubles(3.5, 4.5);
		double peso = (r.nextInt(5)/10.0) + 3.3;
		int battito = r.nextInt(150) + 50;
		int saturazione = r.nextInt(10) + 90;
		double temperatura = r.nextInt(3) + 35;
		boolean pannolino = r.nextInt(4) > 2;
		int stress = controllastress(request, battito, saturazione, temperatura, pannolino);
		LocalDate data = LocalDate.now();
		LocalTime time = LocalTime.now();
		service.insert(new ParametroDTO(0, peso, battito, saturazione, temperatura, stress, data, time, idbambino));
		
	}
	
	
	private int controllastress(HttpServletRequest request, int battito, int saturazione, double temperatura, boolean pannolino) {
		int g =0;
		if(!checkbattiti(request, battito)) g++;
		if(!checkpannolino(request, pannolino)) g++;
		if(!checktemperatura(request, temperatura)) g++;
		if(!checksaturazione(request, saturazione)) g++;
		
		int stress;
		Random r = new Random();
		switch(g) {
		
		
		case 1:
			stress = r.nextInt(10)*4;
			break;
		case 2:
			stress = r.nextInt(10)*7;
			break;
		case 3:
			stress = r.nextInt(10)*9;
			break;
		case 4:
			stress = r.nextInt(10)*10;
			break;
			
		default:
			stress = 0;
			break;
		}
		
		return stress;
	}
	
	@GetMapping("/pianto")
	public String Pianto(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		request.getSession().setAttribute("motivi", piantoservice.pianto(idbambino));
		request.getSession().setAttribute("id", idbambino);
		
		//setAll(request);
		return "perchePiangi";
	}


	@GetMapping("/analisibambino")
	public String read(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		List<ParametroDTO> list = service.findByIdbambino(idbambino);
	//	init(request, idbambino);
		request.getSession().setAttribute("dto", list.get(list.size()-1));
		return "readbambino";
	}
	
	
	@GetMapping("/rileva")
	public String rileva(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		rilevazione(request, idbambino);
		return read(request, idbambino);
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
	
	@GetMapping("/storico")
	public String storico(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		request.getSession().setAttribute("storico", service.findByIdbambino(idbambino));
		return "storicorilevazioni";
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




}
