package it.contrader.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Bambino {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idbambino;

	private String nome;
	
	private LocalDate ddn;
	
	private String cf;
	
	private char sesso;
	
	private int iduser;

}