<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("id") == null) {
        out.println("<script>alert('로그인이 필요합니다.');</script>");
        out.println("<script>location.href='/member/login.jsp';</script>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 상담</title>
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

        .content_area li {margin:20px 0;border-bottom:1px solid #ddd;border-top:1px solid #ddd;box-sizing:border-box;padding:10px 0 0;}
        .content_area li div {line-height:28px;height:28px;}
        .content_area .question_area {font-size:20px;padding-bottom:10px;}
        .content_area .question_area span {display:inline-block;width:50px;text-align:center;line-height:28px;}
        .content_area .answer_area {display:none;font-size:20px;border-top:1px dashed #ddd;padding:10px 0 10px 50px;}
        .content_area .answer_area.show {display:block;}

    </style>

    <!-- 페이징 처리 -->
    <link rel="stylesheet" href="<%=headPath %>/css/jquery.dataTables.css">
    <script src="<%=headPath %>/js/jquery.dataTables.js"></script>
</head>
<body>
<header class="hd" id="hd">
    <%@ include file="../header.jsp" %>
</header>
<div class="wrap">
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/board/boardList.jsp">커뮤니티</a> &gt; <span>자주하는 질문</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">온라인 상담</h2>
                <br><br><hr><br><br>
                <!-- 작성자 id, 보내는 사람 email 주소, 연락처, 상담 제목, 상담내용 입력 폼 -->
                <form action="onlinePro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="name">작성자이름</label></th>
                            <td>
                                <input type="text" name="name" id="name" class="indata" required>
                                <input type="hidden" name="id" id="id" value="<%=sid %>" class="indata">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="from">이메일 주소</label></th>
                            <td><input type="email" name="from" id="from" class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="phone">연락처</label></th>
                            <td><input type="tel" name="phone" id="phone" class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="title">상담제목</label></th>
                            <td><input type="text" name="title" id="title" class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="content">상담내용</label></th>
                            <td>
                                <textarea rows="10" cols="80" name="content" id="content" maxlength="990" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="reset" class="inbtn" value="취소하기">
                                <input type="submit" class="inbtn" value="이메일보내기">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
</div>
<footer class="ft" id="ft">
    <%@ include file="../footer.jsp" %>
</footer>
</body>
</html>