package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.CocoBoardDAO;
import com.smhrd.model.CocoBoardDTO;

public class UpdateBoardService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 파일 업로드 -> MultipartRequest ->  cos.jar
		// 1.모든 요청정보가 담겨있는 request객체
		// 2.업로드 된 파일(이미지)을 저장할 경로	
		String path = request.getServletContext().getRealPath("./upload");
		System.out.println("저장경로:" + path);
		
		// 3.파일의 max size
		int maxSize = 1024*1024*10; 
		
		// 4.인코딩 방식
		String encoding = "utf-8";
		
		// 5.중복제거 -> 파일명 뒤에 숫자를 붙여주는 객체
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest multi;
		
		
		
		int cnt = 0;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			
			int b_views = 0;
			int b_likes = 0;
			
			int num=Integer.parseInt(multi.getParameter("num"));
			
			String b_title = multi.getParameter("title");
			String user_email = multi.getParameter("writer");
			//String b_file = multi.getParameter("filename"); --> 이걸로는 null값 뜸
			//String b_file=multi.getOriginalFileName("filename"); --> 이건 값 받아옴
			String b_file = multi.getFilesystemName("filename");
			String b_content = multi.getParameter("content");
			
			System.out.println("title:" + b_title);
			System.out.println("writer:" + user_email);
			System.out.println("filename:" + b_file);
			System.out.println("content:" + b_content);
			
			
			CocoBoardDTO dto = new CocoBoardDTO(b_title, b_content, b_file, user_email, b_views, b_likes);// num값은 notnull이 아니라 이 구조에 안들어가니까 
		    dto.setB_seq(num); // 숫자값만 따로 넣어주기 
		    
			cnt = new CocoBoardDAO().modifyBoard(dto);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(cnt>0) {
			System.out.println("수정 업로드 성공");
			
		} else {
			System.out.println("수정 업로드 실패");
		}
		response.sendRedirect("board.jsp");
		
		
	}

}
