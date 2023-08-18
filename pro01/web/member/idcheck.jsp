<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 검사</title>
</head>
<body>
<%
    String id = request.getParameter("id");
%>
<div class="container">
    <form action="idload.jsp" method="post" name="child" onsubmit="return invalidCheck(this)">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="12글자 이내">
        <input type="submit" value="아이디중복검사">
    </form>
    <script>
        function invalidCheck(f) {
            var id = f.id.value;
            if(id.length > 12) {
                alert("아이디가 12글자를 초과했습니다.");
                f.id.focus();
            }
        }
    </script>
    <!-- 내 버전
    <label for="id">아이디</label>
    <input type="text" name="id" id="id" value="< %=id %>" readonly>
    <a href="idload.jsp?id=< %=id%>">아이디 중복 검사</a>
    -->
</div>
</body>
</html>