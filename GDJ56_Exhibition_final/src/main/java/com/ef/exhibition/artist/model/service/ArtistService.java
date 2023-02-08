package com.ef.exhibition.artist.model.service;

import java.util.List;
import java.util.Map;

import com.ef.exhibition.artist.model.vo.Artist;

public interface ArtistService {
	
	List<Artist> selectArtistList(Map<String, Integer> page);
	int selectArtistCount();
}

