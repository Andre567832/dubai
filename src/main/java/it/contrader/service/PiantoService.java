package it.contrader.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.contrader.converter.ParametroConverter;
import it.contrader.dao.ParametroRepository;
import it.contrader.dto.ParametroDTO;
import it.contrader.dto.UserDTO;
import it.contrader.model.Parametro;

@Service
public class PiantoService extends AbstractService<Parametro, ParametroDTO> {

	@Autowired
	private ParametroConverter converter;
	@Autowired
	private ParametroRepository repository;

	public List<ParametroDTO> findByIdbambino(int id) {
		return converter.toDTOList(repository.findByIdbambino(id));
	}

	public List<ParametroDTO> findByIdparametro(int id) {
		return converter.toDTOList(repository.findByIdbambino(id));
	}


	public String pianto (int id)	{
		int minM = 1, maxM = 10;
		Random ranM = new Random();
		int espressioneCorporale = ranM.nextInt(maxM) + minM;

		int minL = 1, maxL = 10;
		Random ranL = new Random();
		int succhiaLabbra = ranL.nextInt(maxL) + minL;

		int minA = 1, maxA = 10;
		Random ranA = new Random();
		int crampiAddominali= ranA.nextInt(maxA) + minA;

		int minG = 1, maxG = 10;
		Random ranG = new Random();
		int gonfioreAddominale = ranG.nextInt(maxG) + minG;
		
		
		int pesoPannolino = pannolino();


		Parametro parametro = repository.findByIdparametro(id); 

		int battitoCardiaco = parametro.getBattito();
		double stressBambino = parametro.getStress();
		String motivi = "";

		if (espressioneCorporale <5 && battitoCardiaco<120 && stressBambino>70 ) 
			motivi += "\nil bambino ha probabilmente sonno";
		

		if(espressioneCorporale>7 && gonfioreAddominale>5 && crampiAddominali<8 && crampiAddominali>4) 
			motivi += "\nil bambino potrebbe avere le coliche";

		if(espressioneCorporale>=5 && gonfioreAddominale<5 && crampiAddominali>4 && succhiaLabbra>5)
			motivi += "\nil bambino potrebbe avere fame";
		

		if(espressioneCorporale>=5 && pesoPannolino>6)
			motivi +="\nil pannolino è quasi pieno";
		
		if(motivi.equals("")) motivi += "\nSta probabilmente solo facendo i capricci";
		return motivi;
	}
	
	
	public int pannolino() {
		int minP = 1, maxP = 10;
		Random ranP = new Random();
		int pesoPannolino = ranP.nextInt(maxP) + minP;
		return pesoPannolino;
	}
	
}