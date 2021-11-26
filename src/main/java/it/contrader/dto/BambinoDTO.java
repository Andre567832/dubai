package it.contrader.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BambinoDTO {

	private int idbambino;

	private String nome;
	
	private LocalDate ddn;
	
	private String cf;
	
	private char sesso;
	
	private int iduser;

}
