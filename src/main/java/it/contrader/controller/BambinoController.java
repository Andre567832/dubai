package it.contrader.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import it.contrader.dto.BambinoDTO;

import it.contrader.service.BambinoService;

@Controller
@RequestMapping("/bambino")
public class BambinoController {
	
	
	
	@GetMapping("/preupdate")
	public String preUpdate(HttpServletRequest request, @RequestParam("id") int id) {
		request.getSession().setAttribute("dto", service.read(id));
		return "updatebambino";
	}

	@PostMapping("/update")
	public String update(HttpServletRequest request, @RequestParam("idbambino") int idbambino, @RequestParam("nome") String nome,
			@RequestParam("ddn") LocalDate ddn, @RequestParam("cf") String cf,
			@RequestParam("sesso") char sesso,@RequestParam("iduser") int iduser) {

		BambinoDTO dto = new BambinoDTO();
		dto.setIdbambino(idbambino);
		dto.setNome(nome);
		dto.setDdn(ddn);
		dto.setCf(cf);
		dto.setSesso(sesso);
		dto.setIduser(iduser);
		service.update(dto);
		setAll(request);
		return "bambino";

	}

	
	@Autowired
	private BambinoService service;
	
	@SuppressWarnings("finally")
	@PostMapping("/insert")
	public String insert(HttpServletRequest request, @RequestParam("nome") String nome,
			@RequestParam("ddn") LocalDate ddn, @RequestParam("cf") String cf,
			@RequestParam("sesso") char sesso,@RequestParam("iduser") int iduser) throws MySQLIntegrityConstraintViolationException {
		try {
			
		BambinoDTO dto = new BambinoDTO();
		dto.setNome(nome);
		dto.setDdn(ddn);
		dto.setCf(cf);
		dto.setSesso(sesso);
		dto.setIduser(iduser);
		
		service.insert(dto);
		setAll(request);
		} catch (Exception e) {
			
		}finally {	
		return "index";
		}
		
	}
	
	@GetMapping("/read")
	public String read(HttpServletRequest request, @RequestParam("id") int id) {
		request.getSession().setAttribute("dto", service.read(id));
		return "readbambino";
	}
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest request, @RequestParam("id") int id) {
		service.delete(id);
		setAll(request);
		return "bambino";
	}
	
	private void setAll(HttpServletRequest request) {
		request.getSession().setAttribute("list", service.getAll());
	}
}
