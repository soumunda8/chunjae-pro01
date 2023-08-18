<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="java.security.*" %>
<%@ page import="com.pro01.util.*" %>
<%@ include file="../encoding.jsp"%>
<%

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    pw = AES256.sha256(pw);
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    int cnt = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "insert into member(id, pw, name, tel, email) values(?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, tel);
        pstmt.setString(5, email);
        cnt = pstmt.executeUpdate();
        if(cnt > 0){
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/member/join.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>