package com.exhibition.news.model.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class News {
	@Id
	private int newsNo;
	private String newsTitle;
	private String newsComment;
	
	@Temporal(TemporalType.DATE)
	@Column(name="newsenrolldate")
	private Date newsEnrollDate;
	
	private String newsFilename;	
	
	//memberNo를 fk로 받을예정
	
	
}
