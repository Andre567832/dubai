package it.contrader.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.contrader.converter.BambinoConverter;
import it.contrader.dao.BambinoRepository;
import it.contrader.dto.BambinoDTO;
import it.contrader.dto.UserDTO;
import it.contrader.model.Bambino;

@Service
public class BambinoService extends AbstractService<Bambino, BambinoDTO> {
	
	@Autowired
	private BambinoConverter converter;
	@Autowired
	private BambinoRepository repository;
	
	public BambinoDTO findByIduser(int id) {
		return converter.toDTO(repository.findByIduser(id));
	}
	
}
