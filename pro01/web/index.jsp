<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="head.jsp"%>
    <style>
        /* 본문 영역 스타일 */
        .contents {clear:both;min-height:100vh;}
        .contents::after {content:"";clear:both;display:block;width:100%;}

        .vs {clear:both;width:100%;min-height:600px;background-color:pink;position:relative;overflow:hidden;}
        .img_box {position:relative;width:100%;height:600px;overflow:hidden;}
        .img_box li {visibility:hidden;opacity:0;transition-duration:0.7s;width:100%;height:600px;transition-delay:0.7s;}
        .img_box li.active {visibility:visible;opacity:1;}
        .img_box li .bg_box {width:100vw;height:600px;background-repeat:no-repeat;background-position:center center;background-size:cover;position:absolute;left:0;top:0;z-index:5;}
        .img_box li.active .bg_box {z-index:6;}
        .img_box li.item1 .bg_box {background-image:url(<%=path %>/images/vs01.jpg);}
        .img_box li.item2 .bg_box {background-image:url(<%=path %>/images/vs02.jpg);background-position-y:top;}

        .img_box li .vs_tit {position:absolute;z-index:10;top:180px;left:100px;font-weight:200;font-size:60px;color:#fff;line-height:1.3;}/* 좁다 :1.3 / 넓다 :1.6 */
        .img_box li .vs_tit strong {font-weight:500;}

        .btn_box li .vs_btn {display:block;width:12px;height:12px;background-color:rgba(255,255,255,0.8);border:2px solid rgba(255,255,255,0.8);box-sizing:border-box;position:absolute;top:100px;left:100px;z-index:10;cursor:pointer;border-radius:50%;}
        .btn_box li.item2 .vs_btn {left:132px;}
        .btn_box li.active .vs_btn {background-color:#fff;border:1px solid #333;}
        .vs_ra {display:none;}

        .play_btn {display:block;width:12px;height:12px;position:absolute;top:95px;left:164px;z-index:14;cursor:pointer;background-color:transparent; border:none;color:#fff;font-weight:900;}
        .play_btn::after {content:"| |";}
        .play_btn.active::after {content:"▶";}

        .page {clear:both;width:100vw;height:100vh;position:relative;display:block;}
        .page::after {content:"";width:100%;display:block;clear:both;}

        .page_wrap {clear:both;width:1200px;margin:0 auto;height:auto;}
        .page_tit {text-align:center;font-size:48px;padding-top:1.75em;} /* padding-top:0.5em;(평균) */

        .pic_list {clear:both;width:1200px;margin:62px auto;}
        .pic_list li {width:280px;margin-left:26px;float:left;height:400px;background-repeat:no-repeat;background-position:center center;filter:blur(1px);filter:brightness(90%);transition:0.4s;margin-top:30px;box-shadow:12px 12px 12px #999;overflow:hidden;}
        .pic_list li:hover {filter:blur(0);filter:brightness(140%);margin-top:10px}
        .pic_list li a {display:block;width:256px;height:376px;margin:11px;border:1px solid #fff;color:#fff;}
        .pic_list li:first-child {margin-left:0;}
        .pic_list li.item1 {background-image:url(<%=path %>/images/tab01_01.jpg);}
        .pic_list li.item2 {background-image:url(<%=path %>/images/tab01_02.jpg);}
        .pic_list li.item3 {background-image:url(<%=path %>/images/tab01_03.jpg);}
        .pic_list li.item4 {background-image:url(<%=path %>/images/tab01_04.jpg);}
        .pic_com {padding-left:20px;padding-top:20px;font-size:14px;}
        .pic_tit {padding-left:20px;padding-top:20px;font-size:18px;font-weight:600;}
        .pic_arrow {display:block;width:110px;height:10px;border-bottom:1px solid #fff;margin-top:20px;margin-left:-20px;transition:0.4s;position:relative;}
        .pic_arrow::after {content:"";position:absolute;right:0;bottom:-1px;width:10px;height:10px;border-bottom:1px solid #fff;transform-origin:100% 100%;transform:rotate(45deg);display:none;}
        /*.pic_arrow::after {content:"";position:absolute;right:7px;bottom:-3px;width:1px;height:20px;transform:rotate(135deg);z-index:1;background:#fff;}*/
        .pic_list li:hover a .pic_arrow {margin-left:20px;}
        .pic_list li:hover a .pic_arrow::after {display:block;}

        #page1 {background-color:#f1f2f3;background-image:url(<%=path %>/images/tab01_bg.png);background-position:15vw 63vh;background-repeat:no-repeat;}

        #page2 .page_wrap {width:100%;}
        .slide_box::-webkit-scrollbar {display:none;}
        .slide_box {clear:both;width:calc(100vw - 350px);height:400px;margin-left:350px;-ms-overflow-style:none;scrollbar-width:none;}

        .page_com {text-align:center;padding-top:30px;padding-bottom:30px;}

        .card_list {width:4000px;}
        .card_list > li {width:320px;float:left;height:400px;margin-right:50px;box-shadow:5px 5px 30px #888;border-radius:6px;overflow:hidden;}
        .card_list > li:first-child {margin-left:30px;}
        .card_list li .thumb_box {width:320px;height:210px;background-repeat:no-repeat;background-position:center center;background-size:cover;}
        .card_list li a {display:block;width:320px;height:210px;}
        .card_list li.item2 .thumb_box {background-image:url(<%=path %>/images/cardlist01.png);}
        .card_list li.item3 .thumb_box {background-image:url(<%=path %>/images/cardlist02.png);}
        .card_list li.item4 .thumb_box {background-image:url(<%=path %>/images/cardlist03.png);}
        .card_list li.item5 .thumb_box {background-image:url(<%=path %>/images/cardlist04.png);}
        .card_list li.item6 .thumb_box {background-image:url(<%=path %>/images/cardlist05.png);}
        .card_list li.item7 .thumb_box {background-image:url(<%=path %>/images/cardlist06.png);}

        .thumb_tit {height:44px;box-sizing:border-box;font-size:14px;color:#333;padding:14px;padding-bottom:0;text-overflow:ellipsis;overflow:hidden;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;margin-bottom:60px;}

        .ico_box {height:18px;clear:both;margin-top:30px;border-top:1px solid #eee;padding-top:30px;}
        .ico {width:18px;height:18px;display:block;background-image:url(<%=path %>/images/icon_split.png);background-repeat:no-repeat;float:left;margin-left:14px;}
        .ico.item1 {background-position:-40px -41px;}
        .ico.item2 {background-position:-21px -1px;}

        .thumb_date {float: right;margin-right:14px;}

        .cate_tit {padding-left:32px;font-size:36px;line-height:2;padding-bottom:24px;padding-top:24px;}
        .cate_list li {border-top:1px solid #333;margin-left:14px;margin-right:14px;padding-top:32px;height:90px;}
        .cate_list li a {display:block;}
        .bd_content {width:auto;padding-right:24px;}
        .bd_date {padding-top:18px;}

        .sl-btn-box .btn {display:block;width:48px;height:48px;color:#fff;background-color:#333;text-align:center;line-height:48px;font-size:32px;font-weight:700;cursor:pointer;position:absolute;left:100px;}
        .sl-btn-box .btn.next {top:100px;}
        .sl-btn-box .btn.prev {top:178px;}
    </style>
</head>
<body>
    <div class="wrap">
        <header class="hd" id="hd">
            <%@ include file="header.jsp"%>
        </header>
        <div class="contents" id="contents">
            <%@ include file="main.jsp"%>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="footer.jsp"%>
        </footer>
    </div>
</body>
</html>