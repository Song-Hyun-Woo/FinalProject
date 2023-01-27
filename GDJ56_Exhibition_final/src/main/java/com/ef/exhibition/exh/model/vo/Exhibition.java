package com.ef.exhibition.exh.model.vo;

import java.sql.Date;

import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Exhibition {
	@Id
	private int exNo;
	private String exTitle;
	private String exPoster;
//	private String exPosterPath;
	private Date exDate;
	private String exContent;
	private String exType;
	private int exPrice;
	
}
