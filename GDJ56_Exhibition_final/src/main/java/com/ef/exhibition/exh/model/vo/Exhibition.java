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
	
	private int exNo;					//전시 일련번호
	private String exTitle;				//전시 제목
	private String exPoster;			//전시 포스터 IMG
	
	private Date exStDate;				//전시 시작일
	private Date exEdDate;				//전시 종료일
	private String exContent;			//전시 내용
//	private String exType;				//전시 무료 or 유료
	private int exPrice;				//전시 가격
	
//	private String artistName;
	private Artist artistNo;			//작가 이름
	
	private String exLocation;			//전시 장소
	private String exUrl;				//전시 URL
//	private String exTime;				//전시 시간
}
