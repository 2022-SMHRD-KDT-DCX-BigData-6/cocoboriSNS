package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
// 채팅 내용 
public class CocoChattingDTO {

    // 채팅 순번 
    private Double chat_seq;

    // 채팅방 순번 
    private Double cr_seq;

    // 발화자 
    private String talker;

    // 발화 내용 
    private String talking;

    // 이모티콘 
    private String emoticon;

    // 발화 시간 
    private Date talking_at;

}