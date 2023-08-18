<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.vo.*" %>
<%@ include file="../encoding.jsp"%>
<%
    int lev = Integer.parseInt(request.getParameter("lev"));
    int qno = 0;
    if(lev == 1) {
        qno = Integer.parseInt(request.getParameter("qno"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변 등록하기</title>
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
                <h2 class="page_tit">질문과 답변 등록하기</h2>
                <br><br><hr><br><br>
                <form action="addQnaPro.jsp" method="post">
                    <input type="hidden" name="author" id="author" value="<%=session.getAttribute("id") %>">
                    <input type="hidden" name="lev" id="lev" value="<%=lev %>">
                    <input type="hidden" name="par" id="par" value="<%=qno %>">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="title">글제목</label></th>
                            <td><input type="text" name="title" id="title" class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="content">글내용</label></th>
                            <td>
                                <textarea rows="10" cols="80" name="content" id="content" maxlength="990" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="/qna/qnaList.jsp" class="inbtn">목록</a>
                                <input type="submit" class="inbtn" value="등록하기">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>