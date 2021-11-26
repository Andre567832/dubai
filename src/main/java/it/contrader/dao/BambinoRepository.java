package it.contrader.dao;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import it.contrader.model.Bambino;

@Repository
@Transactional
public interface BambinoRepository extends CrudRepository<Bambino, Integer> {
    
	
	Bambino findByIdbambino(int idbambino);
	
	Bambino findByIduser(int iduser);
	

}
