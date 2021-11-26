package it.contrader.converter;

import org.springframework.stereotype.Component;

import it.contrader.dto.BambinoDTO;

import it.contrader.model.Bambino;

@Component
public class BambinoConverter extends AbstractConverter<Bambino, BambinoDTO> {

	@Override
	public Bambino toEntity(BambinoDTO bambinoDTO) {
		Bambino bambino = null;
		if (bambinoDTO != null) {
			bambino = new Bambino(bambinoDTO.getIdbambino(), bambinoDTO.getNome(),
					bambinoDTO.getDdn(), bambinoDTO.getCf(), bambinoDTO.getSesso(),bambinoDTO.getIduser());
		}
		return bambino;
	}

	@Override
	public BambinoDTO toDTO( Bambino bambino) {
		BambinoDTO bambinoDTO = null;
		if (bambino != null) {
			bambinoDTO = new BambinoDTO(bambino.getIdbambino(), bambino.getNome(),
					bambino.getDdn(), bambino.getCf(), bambino.getSesso(), bambino.getIduser());

		}
		return bambinoDTO;
	}
}