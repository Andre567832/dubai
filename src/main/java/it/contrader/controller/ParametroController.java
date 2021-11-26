package it.contrader.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import it.contrader.service.ParametroService;

@Controller
@RequestMapping("/parametro")
public class ParametroController {
	
	@Autowired
	private ParametroService service;

}
