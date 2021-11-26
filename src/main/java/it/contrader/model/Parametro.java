package it.contrader.model;

import java.time.LocalDate;
import java.time.LocalTime;

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
public class Parametro {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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
