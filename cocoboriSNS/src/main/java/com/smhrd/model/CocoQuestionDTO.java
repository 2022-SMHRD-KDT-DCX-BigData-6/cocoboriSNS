package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class CocoQuestionDTO {
	
	private String num;
	@NonNull private String title;
	@NonNull private String type;
	@NonNull private String writer;
	@NonNull private String content;
	private String q_file;
	private String q_date;
	
}