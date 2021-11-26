package it.contrader.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.contrader.converter.ParametroConverter;
import it.contrader.dao.ParametroRepository;
import it.contrader.dto.ParametroDTO;
import it.contrader.dto.UserDTO;
import it.contrader.model.Parametro;

@Service
public class ParametroService extends AbstractService<Parametro, ParametroDTO> {

	@Autowired
	private ParametroConverter converter;
	@Autowired
	private ParametroRepository repository;
	
	public List<ParametroDTO> findByIdbambino(int id) {
		return converter.toDTOList(repository.findByIdbambino(id));
	}
}
