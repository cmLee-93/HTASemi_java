<%@page import="java.time.LocalDate"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ApprovalVO"%>
<%@page import="dao.ApprovalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//approvalForm
	String data1 = request.getParameter("placeholder1");
	String data2 = request.getParameter("placeholder2");
	String data3 = request.getParameter("placeholder3");
	String data4 = request.getParameter("placeholder4");
	String contents = request.getParameter("contents");
	String title = request.getParameter("title");

		Object obj = session.getAttribute("vo");
		String name = null;
		String dname = null;
		String position = null;
		String stamp = null;
		int num = 0;
		LocalDate now = LocalDate.now();
		if(obj != null){
		EmployeeVO vo0 = (EmployeeVO)obj;
		name = vo0.geteName();
		dname = vo0.getdName();
		position = vo0.geteOfficialResponsibilities();
		num = vo0.geteNumber();
		stamp = vo0.getEstamp();
		ApprovalDAO dao = new ApprovalDAO();
		ApprovalVO vo = new ApprovalVO();
		vo.setaName1st(data1);
		vo.setaName2nd(data3);
		vo.setaTitle(title);
		vo.setaContent(contents);
    	dao.addOne(vo,vo0);
 		response.sendRedirect("approvalList.jsp");  

			
		
	}
	
%>
