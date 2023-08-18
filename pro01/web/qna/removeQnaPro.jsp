<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.vo.*" %>
<%@ include file="../encoding.jsp"%>
<%
    int qno = Integer.parseInt(request.getParameter("qno"));
    int lev = Integer.parseInt(request.getParameter("lev"));
    int cnt = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "";
    if(lev == 0) {
        sql = "delete from qna where par=?";
    } else {
        sql = "delete from qna where qno=?";
    }
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);

    cnt = pstmt.executeUpdate();

    if(cnt > 0) {
        System.out.println("삭제 성공");
        out.println("<script>location.href='/qna/qnaList.jsp'</script>");
    } else {
        System.out.println("삭제 실패");
        out.println("<script>history.go(-1);</script>");
    }

    con.close(pstmt, conn);
%>