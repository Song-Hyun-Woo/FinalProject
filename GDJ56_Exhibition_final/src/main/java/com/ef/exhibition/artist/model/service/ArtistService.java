package com.ef.exhibition.artist.model.service;

import java.util.List;
import java.util.Map;

import com.ef.exhibition.artist.model.vo.Artist;

public interface ArtistService {
	
	List<Artist> selectArtistList(Map<String, Integer> page);		//메인 리스트 페이징
	int selectArtistCount();										//메인 리스트 페이징
	Artist selectArtist(int artNo);									//작가 상세 페이지
	int insertArt(Artist a);										//작가 insert 페이지
	int deleteArt(int artNo);										//작가 delete 페이지
	int updateArt(Map art);											//작가 update 페이지
	
}

