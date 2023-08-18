<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pro01.dto.*" %>
<%@ page import="com.pro01.db.DBC" %>
<%@ page import="com.pro01.db.MariaDBCon" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 - 회원가입</title>
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
            <p><a href="">HOME</a> &gt; <span>회원 가입</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 가입</h2>
                <hr>
                <form action="/member/joinPro.jsp" name="frm1" id="login_frm" class="frm" onsubmit="return inform(this)">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="id">아이디</label></th>
                            <td>
                                <input type="text" name="id" id="id" class="indata" required>
                                <button type="button" id="ck_btn" onclick="idCheck()">아이디 중복 체크</button>
                                <input type="hidden" name="ck_item" id="ck_item" value="no">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pw">비밀번호</label></th>
                            <td><input type="password" name="pw" id="pw" class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="pwChk">비밀번호 확인</label></th>
                            <td><input type="password" name="pwChk" id="pwChk" class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="name">이름</label></th>
                            <td><input type="text" name="name" id="name"  class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="email">이메일</label></th>
                            <td><input type="text" id="email" name="email"  class="indata" required></td>
                        </tr>
                        <tr>
                            <th><label for="tel">전화번호</label></th>
                            <td><input type="text" id="tel" name="tel"  class="indata" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="inbtn" value="회원가입" >
                                <a href="/member/login.jsp" class="inbtn">로그인하기</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                    function inform(frm) {
                        var ck_item = frm.ck_item;                              // 방법 1
                        // var ck_item = document.getElementById("ck_item");    // 방법 2
                        if(ck_item.value != "yes") {
                            alert("아이디 중복 검사를진행하시기 바랍니다.");
                            frm.id.focus();
                            return false;
                        }
                        var pw = frm.pw.value;
                        var pw2 = frm.pwChk.value;

                        if(pw != pw2) {
                            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.")
                            pw.focus();
                            return false;
                        }
                    }
                    function idCheck() {
                        var child;
                        var id = document.getElementById("id");
                        if(id.value!="") {
                            child = window.open("idcheck.jsp?id="+id.value, "child", "width=400,height=400");
                            return false;
                        } else {
                            alert("아이디 입력란에 아이디를 입려하고, 진행하시기 바랍니다.");
                            id.focus();
                            return false;
                        }
                    }
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