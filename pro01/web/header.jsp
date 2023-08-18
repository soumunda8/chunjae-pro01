<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String headerPath = request.getContextPath();
    String sid = (String) session.getAttribute("id");
%>
<div class="hd_wrap">
    <nav class="tnb">
        <ul class="menu">
            <% if(sid != null) { %>
            <li><a href="<%=headerPath %>/member/logout.jsp">로그아웃</a></li>
            <li><a href="<%=headerPath %>/member/mypage.jsp">마이페이지</a></li>
            <li><a href="<%=headerPath %>/map.jsp">오시는길</a></li>
            <% if(sid.equals("admin")) { %>
            <li><a href="<%=headerPath %>/admin/index.jsp">관리자페이지로</a></li>
            <% } %>
            <% } else { %>
            <li><a href="<%=headerPath %>/member/login.jsp">로그인</a></li>
            <li><a href="<%=headerPath %>/member/term.jsp">회원가입</a></li>
            <li><a href="<%=headerPath %>/map.jsp">오시는길</a></li>
            <% } %>
        </ul>
    </nav>
</div>
<div class="hd_wrap">
    <a href="/" class="logo"><img src="<%=headerPath %>/images/logo.png" alt="천재IT교육센터 로고타임"></a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="company.html#com" class="dp1">회사소개</a>
                <ul class="sub">
                    <li><a href="company.html#com">인사말</a></li>
                    <li><a href="company.html#vision">비전및목표</a></li>
                    <li><a href="company.html#history">연혁</a></li>
                    <li><a href="<%=headerPath %>/map.html">오시는길</a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="studyJava.html#structure" class="dp1">JAVA</a>
                <ul class="sub">
                    <li><a href="studyJava.html#structure">생성자란?</a></li>
                    <li><a href="studyJava.html#class">클래스란?</a></li>
                    <li><a href="studyJava.html#trycatch">예외처리란?</a></li>
                    <li><a href="studyJava.html#method">메소드란?</a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="studyHtml.html#tags" class="dp1">HTML&CSS</a>
                <ul class="sub">
                    <li><a href="studyHtml.html#tags">태그란?</a></li>
                    <li><a href="studyHtml.html#style">스타일이란?</a></li>
                    <li><a href="studyHtml.html#web01">웹접근성이란?</a></li>
                    <li><a href="studyHtml.html#web02">웹표준이란?</a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="studyJs.html#events" class="dp1">JS</a>
                <ul class="sub">
                    <li><a href="studyJs.html#events">이벤트란?</a></li>
                    <li><a href="studyJs.html#click">클릭관련 </a></li>
                    <li><a href="studyJs.html#aboutclass">클래스설정관련</a></li>
                    <li><a href="studyJs.html#use">사용방법</a></li>
                </ul>
            </li>
            <li class="item5">
                <a href="/board/boardList.jsp" class="dp1">커뮤니티</a>
                <ul class="sub">
                    <li><a href="/board/boardList.jsp">공지사항</a></li>
                    <li><a href="/qna/qnaList.jsp">질문및답변</a></li>
                    <li><a href="/faq/faqList.jsp">자주하는질문</a></li>
                    <li><a href="connect.html#qna">자유게시판</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>