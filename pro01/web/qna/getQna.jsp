<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.vo.*" %>
<%@ include file="../encoding.jsp"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%

    int qno = Integer.parseInt(request.getParameter("qno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    Qna qna = new Qna();
    String sql = "SELECT * FROM qnalist WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setName(rs.getString("name"));
    } else {
        System.out.println("상세보기 실패");
        response.sendRedirect("/qna/qnaList.jsp");
    }

    SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
    Date date = ymd.parse(qna.getResdate());
    String resdate = ymd.format(date);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변 - 상세보기</title>
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

        .tb1 {width:700px;margin:40px auto;text-align:center}
        .tb1 th, .tb1 td {line-height:20px;padding:10px 0;font-size:14px;}
        .tb1 thead {background-color: #1e85a3;color:#fff;}
        .tb1 .item1 {width:8%;}
        .tb1 .item2 {width:70%;text-align:left;}
        .tb1 .item3 {width:8%;}
        .tb1 .item4 {width:14%;}

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
            <p><a href="/">HOME</a> &gt; <a href="/board/boardList.jsp">커뮤니티</a> &gt; <span>질문과 답변</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문과 답변 상세보기</h2>
                <br><br><hr><br><br>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <th>유형</th>
                        <td>
                            <% if(qna.getLev() == 0) { %>
                            <span>질문</span>
                            <% } else { %>
                            <span>답글</span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>글제목</th>
                        <td><%=qna.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글내용</th>
                        <td><%=qna.getContent() %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            <% if(sid != null && sid.equals("admin")) { %>
                            <span title="<%=qna.getAuthor() %>"><%=qna.getName() %></span>
                            <% } else { %>
                            <span><%=qna.getName() %></span>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><%=resdate %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=qna.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- 용도별 링크 버튼 추가 -->
                            <!--
                                1.  현재 글이 질문 글이면, 로그인한 사람만 답변하기,
                                    질문을 등록한 사람(관리자포함)만 질문글 수정,
                                    질문글 삭제 버튼 추가
                                2.  답변글이면
                                    답변을 등록한 사람(관리자포함)만 답변글 삭제,
                                    답변글 버튼 수정
                            -->
                            <!-- 모든 사용자 목록 버튼 추가 -->
                            <a href="/qna/qnaList.jsp" class="inbtn">목록</a>

                            <% if(sid != null) { %>   <!-- 로그인할때만 -->
                                <% if(qna.getLev() == 0) { %>   <!-- 질문글일때 -->
                                    <a href="/qna/addQna.jsp?lev=1&qno=<%=qno %>" class="inbtn">답변하기</a>
                                    <% if(sid.equals("admin") || sid.equals(qna.getAuthor())) { %> <!-- 관리자랑 등록자로 로그인시 -->
                                        <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">수정하기</a>
                                        <a href="/qna/removeQnaPro.jsp?qno=<%=qna.getQno() %>&lev=0" class="inbtn">삭제하기</a>
                                    <% } %>
                                <% } else { %>   <!-- 답변글일때 -->
                                    <% if(sid.equals("admin") || sid.equals(qna.getAuthor())) { %> <!-- 관리자랑 등록자로 로그인시 -->
                                        <a href="/qna/updateQna.jsp?qno=<%=qna.getQno() %>" class="inbtn">수정하기</a>
                                        <a href="/qna/removeQnaPro.jsp?qno=<%=qna.getQno() %>&lev=1" class="inbtn">삭제하기</a>
                                    <% } %>
                                <% } %>
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