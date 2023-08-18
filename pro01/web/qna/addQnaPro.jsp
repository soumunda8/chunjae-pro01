<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.vo.*" %>
<%@ include file="../encoding.jsp"%>
<%
    int lev = Integer.parseInt(request.getParameter("lev"));
    int par = 0;
    if(lev == 1) {
        par = Integer.parseInt(request.getParameter("par"));
    }
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("author");

    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "insert into qna(title, content, author, lev, par) values(?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);
    pstmt.setInt(4, lev);
    pstmt.setInt(5, par);

    int cnt = pstmt.executeUpdate();

    if(lev == 0) {
        pstmt.close();
        sql = "update qna set par=qno where par=0 and lev=0";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        cnt++;
    }

    if(lev == 1) {
        pstmt.close();
        sql = "update qna set cnt = cnt+1 where qno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, par);
        pstmt.executeUpdate();
    }

    con.close(pstmt, conn);

    if(cnt == 2) {
        System.out.println("질문 하기 성공");
        out.println("<script>location.href='/qna/qnaList.jsp'</script>");
    } else if(cnt ==1 ) {
        System.out.println("답변 달기 성공");
        out.println("<script>location.href='/qna/qnaList.jsp'</script>");
    } else {
        System.out.println("뭔가 잘못됨..");
        out.println("<script>history.go(-1);</script>");
    }
%>