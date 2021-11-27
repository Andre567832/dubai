package it.contrader.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import it.contrader.model.Bambino;

@Repository
@Transactional
public interface BambinoRepository extends CrudRepository<Bambino, Integer> {
    
	
	Bambino findByIdbambino(int idbambino);
	
	List<Bambino> findByIduser(int iduser);
	

}
