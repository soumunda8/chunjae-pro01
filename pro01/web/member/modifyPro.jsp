<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.dto.*" %>
<%@ include file="../encoding.jsp"%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String pw2 = request.getParameter("pw2");
    String re_pw = request.getParameter("re_pw");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    int cnt = 0;

    String apw = "";
    if(pw2.equals(re_pw)) {
        apw = pw;
    } else {
        apw = re_pw;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "update member set pw=?, name = ?, tel=?, email=? where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, apw);
        pstmt.setString(2, name);
        pstmt.setString(3, tel);
        pstmt.setString(4, email);
        pstmt.setString(5, id);
        cnt = pstmt.executeUpdate();
        if(cnt > 0){
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/member/modify.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>