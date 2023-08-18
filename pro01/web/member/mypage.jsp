<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.dto.*" %>
<%@ page import="com.pro01.db.DBC" %>
<%@ page import="com.pro01.db.MariaDBCon" %>
<%

    String id = (String) session.getAttribute("id");        // 세션의 id 불러오기

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
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문에 오류가 있습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
            <p><a href="">HOME</a> &gt; <span>마이페이지</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">나의 정보</h2>
                <hr>
                <table class="tb1">
                    <tbody>
                        <tr>
                            <th>아이디</th>
                            <td><%=mem.getId() %></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <%
                                    for(int i = 0; i < mem.getPw().length(); i++) {
                                        out.print("*");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><%=mem.getName() %></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><%=mem.getEmail() %></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%=mem.getTel() %></td>
                        </tr>
                        <tr>
                            <th>포인트</th>
                            <td><%=mem.getPoint() %></td>
                        </tr>
                        <tr>
                            <th>가입일자</th>
                            <td><%=mem.getRegdate() %></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="colspan">
                                <a href="/member/modify.jsp" class="inbtn">회원 정보 수정</a>
                                <a href="/" class="inbtn">메인으로</a>
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