<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ include file="../encoding.jsp"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    List<Qna> qnaList = new ArrayList<>();
    try {
        String sql = "SELECT * FROM qnalist";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Qna qna = new Qna();
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setAuthor(rs.getString("author"));
            qna.setResdate(rs.getString("resdate"));
            qna.setCnt(rs.getInt("cnt"));
            qna.setLev(rs.getInt("lev"));
            qna.setPar(rs.getInt("par"));
            qna.setName(rs.getString("name"));
            qnaList.add(qna);
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문에 문제가 생겼습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변</title>
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
        .inbtn { display:block;  border-radius:100px;min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }

        .subTitle {padding-left:10px;}
    </style>

    <!-- 페이징 처리 -->
    <link rel="stylesheet" href="<%=headPath %>/css/jquery.dataTables.css">
    <script src="<%=headPath %>/js/jquery.dataTables.js"></script>
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
                <h2 class="page_tit">질문과 답변 목록</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1">글번호</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                        int num = qnaList.size();
                        for(Qna qna:qnaList) {
                            Date date = ymd.parse(qna.getResdate());
                            String resdate = ymd.format(date);
                    %>
                    <tr>
                        <td class="item1"><%=num %></td>
                        <td class="item2">
                            <% if(qna.getLev() == 0) { %>
                            <a href="/qna/getQna.jsp?qno=<%=qna.getQno() %>"><%=qna.getTitle() %></a>
                            <% } else { %>
                            <a href="/qna/getQna.jsp?qno=<%=qna.getQno() %>" class="subTitle">&#9492; [답변] <%=qna.getTitle() %></a>
                            <% } %>
                        </td>
                        <td class="item3"><%=qna.getName() %></td>
                        <td class="item4"><%=resdate %></td>
                    </tr>
                    <%
                            num--;
                        }
                    %>
                    </tbody>
                </table>
                <script>
                    $(document).ready(function(){
                        $('#myTable').dataTable({
                            //"ordering": false,
                            order:[[0, "desc"]],
                        });
                    })
                </script>

                <% if(sid != null) { %>
                <div class="btn_group">
                    <a href="/qna/addQna.jsp?lev=0" class="inbtn">질문하기</a>
                </div>
                <% } %>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>