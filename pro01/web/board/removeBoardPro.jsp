<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.dto.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%

    int bno = Integer.parseInt(request.getParameter("bno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "delete from board where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, bno);
    cnt = pstmt.executeUpdate();
    if(cnt > 0){
        response.sendRedirect("/board/boardList.jsp");
    } else {
        response.sendRedirect("/board/getBoard.jsp?bno="+bno);
    }
    con.close(pstmt, conn);

%>