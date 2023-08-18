<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String headPath = request.getContextPath();
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=dege"> <!-- 인터넷익스프로러로 접근시 엣지로 연결되게 함 -->
<meta http-equiv="Author" content="천재교육 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="천재교육 김기태">
<meta http-equiv="Copyright" content="Copyright@chunjae.co.kr">
<title>천재교육</title>

<!-- 검색엔진 최적화(SEO:Search Engeen) -->
<meta name="Subject" content="천재교육, 천재IT교육센터">
<meta name="Keyword" content="천재교육, 천재 IT, 교육 교재, 교과서, 스마트 교육">
<meta name="Description" content="천재교육은 교과서 제작, 교육 교재 제작, 초등, 중등, 고등 교재">
<meta name="Robots" content="index, follow">
<!-- <meta name="Robots" content="noindex, nofollow"> // 검색안하게 하는 설정 -->

<!-- 오픈 그래프(Open graph) -->
<meta property="og:type" content="website">
<meta property="og:title" content="천재교육">
<meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta property="og:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">
<meta property="og:url" content="https://kktlove.github.io/web01">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="천재교육">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://soumunda8.github.io/web01/images/chunjae_logo.png">

<!-- 웹/앱과 같이 모바일로 들어오면 모바일주소를 출력 -->
<!-- 모바일 앱이 ios 인 경우 -->
<meta property="al:ios:url" content="ios 앱 url">
<meta property="al:ios:app_store_id" content="ios 앱스토어 ID">
<meta property="al:ios:app_name" content="ios 앱 이름">
<!-- 모바일 앱이 android 인 경우 -->
<meta property="al:android:url" content="안드로이드 앱 URL">
<meta property="al:android:app_name" content="안드로이드 앱 이름">
<meta property="al:android:package" content="안드로이드 앱 패키지">
<meta property="al:web:url" content="안드로이드 앱 URL">

<!-- 파비콘 설정 :32X32 자주 사용 -->
<!-- 16X16, 24X24, 32X32, 48X48, 64X64, 96X96, 114X114, 128X128, 256X256 등을 활용 -->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="<%=headPath %>/images/logo.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-ico-precomposed" href="<%=headPath %>/images/logo64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#fff">
<meta name="msapplication-TileImage" content="./images/logo48.png">

<!-- 파이어폭스, 오페라 또는 구형 크롬/사파리 -->
<link rel="icon" href="<%=headPath %>/images/logo16.png" sizes="16x16">
<link rel="icon" href="<%=headPath %>/images/logo32.png" sizes="32x32">
<link rel="icon" href="<%=headPath %>/images/logo48.png" sizes="48x48">
<link rel="icon" href="<%=headPath %>/images/logo64.png" sizes="64x64">

<script>
    document.oncontextmenu = function () {return false;}
    document.ondragstart = function () {return false;}
    document.onselectstart = function () {return false;}
    //document.onkeydown = function () {return false;}
</script>

<!-- 스타일 초기화 :reset.css 또는 normalize.css -->
<!-- <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet"> // reset.css cdn -->
<link rel="stylesheet" href="<%=headPath %>/css/fonts.css">
<link rel="stylesheet" href="<%=headPath %>/css/google.css">
<link rel="stylesheet" href="<%=headPath %>/css/reset.css">
<link rel="stylesheet" href="<%=headPath %>/css/common.css">
<link rel="stylesheet" href="<%=headPath %>/css/hd.css">
<link rel="stylesheet" href="<%=headPath %>/css/ft.css">

<!-- 필요한 폰트를 로딩 :구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 필요한 플러그인 연결 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>