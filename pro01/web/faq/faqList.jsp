<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.db.*" %>
<%@ page import="com.pro01.dto.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "select * from faq";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Faq> faqList = new ArrayList<>();
    while(rs.next()) {
        Faq faq = new Faq();
        faq.setFno(rs.getInt("fno"));
        faq.setQuestion(rs.getString("question"));
        faq.setAnswer(rs.getString("answer"));
        faqList.add(faq);
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주하는 질문 목록</title>
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
                    <h2 class="page_tit">자주하는 질문 목록</h2>
                    <br><br><hr><br><br>
                    <ul class="content_area" id="faqArea">
                        <%
                            int cnt = 1;
                            for(Faq f:faqList) {
                        %>
                        <li>
                            <div class="question_area" onclick="showAnswer(<%=cnt %>)">
                                <span><%=cnt %></span><%=f.getQuestion() %>
                            </div>
                            <div class="answer_area" id="item<%=cnt %>">&#9492; <%=f.getAnswer() %></div>
                            <% if(sid != null && sid.equals("admin")) { %>
                            <div>
                                <hr>
                                <a href="updateFaq.jsp?fno=<%=f.getFno()%>">수정하기</a>
                                <a href="removeFaqPro.jsp?fno=<%=f.getFno()%>">삭제하기</a>
                            </div>
                            <% } %>
                        </li>
                        <% cnt++; } %>
                    </ul>
                    <% if(sid != null && sid.equals("admin")) { %>
                    <div>
                        <a href="addFaq.jsp" class="inbtn">등록하기</a>
                    </div>
                    <% } %>
                </div>
                <script>
                    $(document).ready(
                        function (){
                            //toggle 사용
                        }
                    );
                    function showAnswer(e) {
                        $(".answer_area").removeClass("show");

                        var ids = "#item"+e;
                        $(ids).addClass("show");
                    }
                </script>
            </section>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</body>
</html>