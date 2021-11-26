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
	
	
	
	@GetMapping("/storico")
	public String storico(HttpServletRequest request, @RequestParam("idbambino") int idbambino) {
		request.getSession().setAttribute("storico", service.findByIdbambino(idbambino));
		return "storicorilevazioni";
	}


}
