package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

public class CocoChattingDTO {

    // 채팅 순번 
    private int chat_seq;

    // 채팅방 순번 
    @NonNull private Double cr_seq;

    // 발화자 
    @NonNull private String talker;

    // 발화 내용 
    @NonNull private String talking;

    // 발화 시간 
    private String talking_at;

}