<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../encoding.jsp"%>
<%

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int bno = Integer.parseInt(request.getParameter("bno"));
    int cnt = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "update board set title=?, content=? where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, bno);
    cnt = pstmt.executeUpdate();
    if(cnt > 0) {
        response.sendRedirect("/board/boardList.jsp");
    } else {
        response.sendRedirect("/board/getBoard.jsp?bno="+bno);
    }
    con.close(pstmt, conn);


%>