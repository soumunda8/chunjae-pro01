<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ include file="../encoding.jsp"%>
<%
    int fno = Integer.parseInt(request.getParameter("fno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "delete from faq where fno = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, fno);
    cnt = pstmt.executeUpdate();

    if(cnt > 0){
        System.out.println("삭제성공");
    } else {
        System.out.println("삭제성공");
    }

    out.println("<script>location.href='/faq/faqList.jsp'</script>");

%>