package it.contrader.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import it.contrader.service.BambinoService;

@Controller
@RequestMapping("/bambino")
public class BambinoController {
	
	@Autowired
	private BambinoService service;
}
