package com.ef.exhibition.exh.model.vo;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.ef.exhibition.artist.model.vo.Artist;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Exhibition {
	@Id
	private int exNo;
	private String exTitle;
	private String exPoster;
//	private String exPosterPath;
	
	private Date exStDate;
	private Date exEdDate;
	private String exContent;
	private String exType;
	private int exPrice;
	
	private Artist artistNo;
	
	private String exLocation;
	private String exUrl;
	
	
}
