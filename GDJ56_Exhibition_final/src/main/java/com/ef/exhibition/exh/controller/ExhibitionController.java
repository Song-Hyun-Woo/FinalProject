package com.ef.exhibition.exh.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ef.exhibition.exh.model.service.ExhibitionService;

@Controller
public class ExhibitionController {
	
	private ExhibitionService service;

	@Autowired
	public ExhibitionController(ExhibitionService service) {
		super();
		this.service = service;
	}
	//박물관 미술관 API 적용
	
	
	
	
	
	
}
