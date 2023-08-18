<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.dto.*" %>
<%@ page import="com.pro01.db.DBC" %>
<%@ page import="com.pro01.db.MariaDBCon" %>
<%

    String modifyPath = request.getContextPath();
    String id = (String) session.getAttribute("id");        // 세션의 id 불러오기
    String pw = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Member mem = new Member();                              // 마이페이지에 담길 회원 객체 생성

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null) {
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "select * from member where id = ?";       // DB 에서 로그인한 회원의 정보를 검색
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()) {      // 해당 회원의 정보를 DB 에서 로딩하여 회원 객체의 필드의 값으로 저장
            mem.setId(rs.getString("id"));
            mem.setPw(rs.getString("pw"));
            mem.setName(rs.getString("name"));
            mem.setEmail(rs.getString("email"));
            mem.setTel(rs.getString("tel"));
            mem.setRegdate(rs.getString("regdate"));
            mem.setPoint(rs.getInt("point"));
            pw = mem.getPw();
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문에 오류가 있습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }

    // 비밀번호 * 표시
    String pw2 = pw.substring(0,2);
    for(int i = 0; i < pw.length()-2; i++) {
        pw2 += "*";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 정보수정</title>
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

        .tb1 {width:500px;margin:40px auto; }
        .tb1 td {line-height:20px;padding:10px 0;}

        .indata { display:inline-block; height: 48px; line-height: 48px;text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
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
            <p><a href="">HOME</a> &gt; <span>정보 수정</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 정보 수정</h2>
                <hr>
                <form action="/member/modifyPro.jsp" id="login_frm" class="frm">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="id">아이디</label></th>
                            <td><input type="text" value="<%=mem.getId() %>" name="id" id="id" class="indata" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="re_pw">비밀번호</label></th>
                            <!--
                            re_pw에 입력한 값과 pw2의 값이 같으면, 원래 pw를 전달
                            서로 다르면, re_pw로 비밀번호를 변경할 것임
                            -->
                            <td>
                                <input type="text" value="<%=pw2 %>" name="re_pw" id="re_pw" class="indata" required>
                                <input type="hidden" name="pw2" id="pw2" value="<%=pw2 %>">
                                <input type="hidden" name="pw" id="pw" value="<%=mem.getPw() %>">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="name">이름</label></th>
                            <td><input type="text" value="<%=mem.getName() %>" name="name" id="name"  class="indata" disabled></td>
                        </tr>
                        <tr>
                            <th><label for="email">이메일</label></th>
                            <td><input type="text" value="<%=mem.getEmail() %>" id="email" name="email"  class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="tel">전화번호</label></th>
                            <td><input type="text" value="<%=mem.getTel() %>" id="tel" name="tel"  class="indata" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="inbtn" value="회원 정보 수정" >
                                <a href="/member/mypage.jsp" class="inbtn">마이페이지</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <script>

                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>