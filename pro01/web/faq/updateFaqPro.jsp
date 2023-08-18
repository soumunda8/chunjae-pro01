<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ include file="../encoding.jsp"%>
<%
    int fno = Integer.parseInt(request.getParameter("fno"));
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "update faq set question=?, answer=? where fno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, question);
    pstmt.setString(2, answer);
    pstmt.setInt(3, fno);
    cnt = pstmt.executeUpdate();

    if(cnt > 0){
        System.out.println("수정성공");
        out.println("<script>location.href='/faq/faqList.jsp'</script>");
    } else {
        System.out.println("수정실패");
        out.println("<script>history.go(-1)</script>");
    }

%>