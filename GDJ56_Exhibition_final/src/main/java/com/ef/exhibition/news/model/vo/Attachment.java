package com.ef.exhibition.news.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attachment {
	private int attachmentNo;
	private News news;
	private String originalFilename;
	private String renamedFilename;
}
