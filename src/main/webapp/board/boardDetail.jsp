<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="#">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>	
	
	<title>게시글보기</title>
	<style>
		table{
			width: 900px;
			margin: auto;
			border-bottom: 1px solid black;
			
		}
		table, th, td{
			border-top : 1px solid black;
			border-collapse: collapse;
			text-align : center;
		}
	</style>
</head>
<body class="sb-nav-fixed">
<%
	//1. 전달받은 파라미터의 값 가져오기
		String b = request.getParameter("bno");
	//2. bno null 이 아니면
		if(b != null){
	//3. 숫자로 형 변환 
			int bno = Integer.parseInt(b);
	//4. dao 객체 
			BoardDAO dao = new BoardDAO();
	//5. dao를 통해서 지정한 게시물 가져오기(vo): dao.selectOne(bno);
			BoardVO vo = dao.selectOne(bno);
	//6. 화면에 출력(테이블 형태로 출력)
			if(vo!=null){
	//7. 자원반납 dao.close();
			dao.close();
	
%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"><%@ include file="../menu/navi.jsp" %></nav>
    <div id="layoutSidenav"> 
    <div id="layoutSidenav_nav"><%@ include file="../menu/side.jsp" %></div>  
    <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판</h1>
				<div class="card mb-4">
				<h2>게시글 보기</h2>
				<table>
					<tr>
						<th>작성자</th>
						<td><%=vo.getbWriter() %></td>
						<th>조회수</th>
						<th><%=vo.getbView() %></th>
						<th>작성일시</th>
						<th><%=vo.getbRegdate() %></th>
						<%-- <!-- 수정후 입력 누르면 글번호 사라져서 파라미터에 글번호 다시 추가해주기 위해 -->
						<input type="hidden" name="bno" value="<%=vo.getbNo() %>"/> --%>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5"><%=vo.getbTitle() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5"><%=vo.getbContent() %></td>
					</tr>
					<tr>
						<td colspan="6">
						<a href="boardList.jsp"><input type="button" value="목록" /></a>
						<a href="boardModify.jsp?bno=<%=vo.getbNo()%>"><input type="button" value="수정" /></a>
						<a href="boardDeleteOk.jsp?bno=<%=vo.getbNo()%>"><input type="button" value="삭제" /></a>
						</td>
					</tr>	
				</table>
	<%
	}
		}
	%>
				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto"><%@ include file="../menu/footer.jsp" %></footer>
		</div>
        </div>
        
        <!--  부트스트랩 JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<script src="../js/scripts.js"></script><!-- 사이드바 열고 닫기 -->
      
</body>
</html>