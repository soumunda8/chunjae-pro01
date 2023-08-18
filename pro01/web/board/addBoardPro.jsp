<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 1. 필요한 sql, db 패키지 임포트 --%>
<%@ page import="java.lang.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../encoding.jsp"%>
<%-- 2. 인코딩 및 보내온 데이터 받기 --%>
<%

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = (String) session.getAttribute("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "insert into board(title, content, author) values(?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    cnt = pstmt.executeUpdate();
    if(cnt > 0){
        response.sendRedirect("/board/boardList.jsp");
    } else {
        String script = "<script>";
        script += "history.go(-1);";
        script += "<script>";
        out.println(script);
    }
    con.close(pstmt, conn);

%>