package it.contrader.dao;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import it.contrader.model.Parametro;

@Repository
@Transactional
public interface ParametroRepository extends CrudRepository<Parametro, Integer> {

	Parametro findByIdparametro(int idparametro);
	Parametro findByIdbambino(int idbambino);

}
