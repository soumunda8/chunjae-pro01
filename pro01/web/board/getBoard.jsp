<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pro01.dto.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    Board bd = new Board();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        String sql = "select * from board where bno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bno);
        rs=pstmt.executeQuery();
        if(rs.next()) {
            bd.setBno(rs.getInt("bno"));
            bd.setTitle(rs.getString("title"));
            bd.setContent(rs.getString("content"));
            bd.setAuthor(rs.getString("author"));
            bd.setResdate(rs.getString("resdate"));
            bd.setCnt(rs.getInt("cnt"));
        } else {
            response.sendRedirect("/board/boardList.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문에 오류가 있습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
    Date date = ymd.parse(bd.getResdate());
    String resdate = ymd.format(date);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <%@ include file="../head.jsp" %>
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;background-image: url("../images/bg_visual_overview.jpg");background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;width:1200px; margin: 0 auto; text-align: right; color:#fff;padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 {width:700px;margin:40px auto;}
        .tb1 th, .tb1 td {line-height:20px;padding:10px 0;}
        .tb1 th {background-color: #1e85a3;color:#fff;width:20%;text-align:center;}
        .tb1 td {text-align:left;padding-left:20px;}

        .indata { display:inline-block; height: 48px; line-height: 48px;text-indent:14px; font-size:18px; }
        .inbtn { display:inline-block;  border-radius:100px;height:48px;width:160px; padding-left: 24px; padding-right: 24px; text-align: center;line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/board/boardList.jsp">커뮤니티</a> &gt; <span>공지사항</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항 상세보기</h2>
                <hr>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th>글번호</th>
                        <td><%=bd.getBno() %></td>
                    </tr>
                    <tr>
                        <th>글제목</th>
                        <td><%=bd.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%=bd.getAuthor() %></td>
                    </tr>
                    <tr>
                        <th>글본문</th>
                        <td><%=bd.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><%=resdate %></td>
                    </tr>
                    <tr>
                        <th>본횟수</th>
                        <td><%=bd.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br><hr><br>
                            <a href="boardList.jsp" class="inbtn">목록으로</a>
                        <% if(sid != null && (sid.equals("admin") || sid.equals(bd.getAuthor()))) { %>
                            <a href="removeBoardPro.jsp?bno=<%=bd.getBno() %>" class="inbtn">글삭제하기</a>
                            <a href="updateBoard.jsp?bno=<%=bd.getBno() %>" class="inbtn">글수정하기</a>
                        <% } else { %>
                            <p>관리자만 공지사항의 글을 쓸 수 있습니다.<br>로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                        <% } %>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>