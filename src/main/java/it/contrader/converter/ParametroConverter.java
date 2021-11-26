package it.contrader.converter;

import org.springframework.stereotype.Component;

import it.contrader.dto.ParametroDTO;

import it.contrader.model.Parametro;

@Component
public class ParametroConverter extends AbstractConverter<Parametro, ParametroDTO> {

	@Override
	public Parametro toEntity(ParametroDTO parametroDTO) {
		Parametro parametro = null;
		if (parametroDTO != null) {
			parametro = new Parametro(parametroDTO.getIdparametro(), parametroDTO.getPeso(),
					parametroDTO.getBattito(), parametroDTO.getSaturazione(), parametroDTO.getTemperatura(),
					parametroDTO.getStress(),parametroDTO.getData(), parametroDTO.getOra(), parametroDTO.getIdbambino() );
		}
		return parametro;
	}

	@Override
	public ParametroDTO toDTO(Parametro parametro) {
		ParametroDTO parametroDTO = null;
		if (parametro != null) {
			parametroDTO = new ParametroDTO(parametro.getIdparametro(), parametro.getPeso(),
					parametro.getBattito(), parametro.getSaturazione(), parametro.getTemperatura(),
					parametro.getStress(), parametro.getData(), parametro.getOra(), parametro.getIdbambino());

		}
		return parametroDTO;
	}
}