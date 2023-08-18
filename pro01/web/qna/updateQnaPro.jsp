<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.vo.*" %>
<%@ include file="../encoding.jsp"%>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");
    int cnt = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "update qna set title=?, content=?, author=? where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    pstmt.setInt(4, qno);

    cnt = pstmt.executeUpdate();

    pstmt.close();

    sql = "update qna set cnt = cnt+1 where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    pstmt.executeUpdate();

    if(cnt > 0) {
        System.out.println("수정 성공");
        out.println("<script>location.href='/qna/getQna.jsp?qno=" + qno +"'</script>");
    } else {
        System.out.println("수정 실패");
        out.println("<script>history.go(-1);</script>");
    }

    con.close(pstmt, conn);
%>