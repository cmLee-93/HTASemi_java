<%@page import="vo.EmployeeVO"%>
<%@page import="vo.AddfileVO"%>
<%@page import="java.io.File"%>
<%@page import="dao.AddfileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	Object obj= session.getAttribute("vo");
	
	String saveDir = request.getRealPath("/upload"); //upload 디렉토리의 실제 경로 얻어오기
	int maxFileSize = 1024*1024*30; //첨부파일 최대 크기

	MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//파라미터값 가져오기
	String filename = mr.getOriginalFileName("filename"); //파일의 원래 이름
	String title = mr.getParameter("title");
	String ename = mr.getParameter("ename");
	String content = mr.getParameter("content");
	String enumber = mr.getParameter("enumber");
	
	int eNumber = 0;
	if(enumber != null)
		eNumber = Integer.parseInt(enumber);
	
	BoardVO bvo = new BoardVO();

	//보드의 시퀀스?
	BoardDAO bdao = new BoardDAO();
	int bno = bdao.getBseq();
			
	String fLoc = saveDir;	//걍 가독성위해
	
	//db에도 저장되어 있어야 함
	AddfileDAO fdao = new AddfileDAO();
	AddfileVO fvo = new AddfileVO();
	fdao.upload(bno, filename, fLoc);
	
	/* out.println(bno);
	out.println(filename);
	out.println(fLoc); */
	
	//2. 이 값이 null이면 list.jsp 리다이렉트
	// equals: 아무값도 안줬을때도 넘어가게 하기위해
	if(title == null /* || ename == null  */ || content == null
		|| title.equals("") ||/*  ename.equals("") || */ content.equals("") ){
		response.sendRedirect("boardList.jsp");
	//3. null이 아니면 dao객체 생성
	}else if(title != null && /* ename != null && */ content != null){
		bvo.setbNo(bno);
		bvo.setbTitle(title);
		bvo.setbWriter(ename);
		bvo.setbContent(content);
		bvo.seteNumber(eNumber);
	//4. dao.addOne(vo); //db에 저장
  		bdao.addOne(bvo);		
  		
  		if(filename != null){
  			File oldFile = new File(saveDir+"\\"+filename);
  			File newFile = new File(saveDir+"\\"+(bno)+"photo.jpg");
  			oldFile.renameTo(newFile);
  		}
	//5. list.jsp 리다이렉트
		response.sendRedirect("boardList.jsp");  
		out.println(title);
	}
	

%>