package com.ef.exhibition.exh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ef.exhibition.exh.model.service.ExhibitionService;

@Controller
public class ExhibitionController {
	
	private ExhibitionService service;

	@Autowired
	public ExhibitionController(ExhibitionService service) {
		super();
		this.service = service;
	}
	
	
}
