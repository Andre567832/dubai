package it.contrader.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ParametroDTO {

private int idparametro;
	
	private double peso;
	private int battito;
	private int saturazione;
	private double temperatura;
	private double stress;
	private LocalDate data;
	private LocalTime ora;
	private int idbambino;

}
