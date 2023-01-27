package com.ef.exhibition.artist.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ArtistController {
	
	//artist API
		@RequestMapping(value="/apitest", method= {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
	    public String callapihttp(@RequestParam(value="page", defaultValue = "1") String page, 
	    		@RequestParam(value="perPage", defaultValue = "10") String perPage) throws IOException{
	 
			StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15046037/v1/uddi:1f0edcd2-936a-4526-9b57-824e5c76bf0d"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") +"="+"E73Ohe7B%2FH9DEJIDzG3YUN7AnDNcNP3MK2KKjaIw6k%2B2XZ4nFoJiu2J1hhsv3X5Exs8AZPlRqH4yEv5K%2Bx6CCw%3D%3D"); /*서비스키*/
			urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*세션당 요청레코드수*/
			urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode(perPage, "UTF-8")); /*페이지수*/

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {

			sb.append(line);

			}
			rd.close();
			conn.disconnect();
			
			return new String(sb);
	    }

		
		@RequestMapping("/artistList.do")
		public String artistListPage() {
			return "artist/artistList";
		}
}
