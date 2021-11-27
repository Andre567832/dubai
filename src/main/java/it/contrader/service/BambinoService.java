package it.contrader.service;

import java.util.List;

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
	
	public List<BambinoDTO> findByIduser(int iduser) {
		return converter.toDTOList(repository.findByIduser(iduser));
	}
	
	@Override
	public BambinoDTO read(long id) {
		return converter.toDTO(repository.findByIdbambino((int) id));
	}
	
}
