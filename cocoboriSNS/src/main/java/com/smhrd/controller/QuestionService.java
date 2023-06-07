package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.Command;
import com.smhrd.model.CocoQuestionDAO;
import com.smhrd.model.CocoQuestionDTO;

public class QuestionService implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("./file");
		System.out.println("저장경로 :  " + path);
		
		int maxSize = 1024*1024*10;  // 10MB
		
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest multi;
		int cnt = 0;
		
		try {
			
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			String title = multi.getParameter("title");
			String type = multi.getParameter("type");
			String writer = "y"; //request.getParameter("tel"); 작성자 세션으로 받아오기 String writer = multi.getParameter("writer"); 
			String filename = multi.getFilesystemName("filename");
			String content = multi.getParameter("content");
			
			System.out.println("title : " + title);
			System.out.println("type : " + type);
			System.out.println("writer : " + writer);
			System.out.println("filename : " + filename);
			System.out.println("content : " + content);
			
			CocoQuestionDTO question = new CocoQuestionDTO(null, title, type, writer, content, filename, null, null);
			CocoQuestionDAO dao = new CocoQuestionDAO();
			cnt = dao.questionUpload(question);
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		if(cnt > 0) {
			System.out.println("업로드 성공");
		} else {
			System.out.println("업로드 실패");
		}
		
		return "main.jsp";
		
	}
	
	
}
