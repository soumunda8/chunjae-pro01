<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 1. 필요한 라이브러리 가져오기 --%>
<%@ page import="com.pro01.util.*" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%-- 2. 인코딩 설정 --%>
<%@ include file="../encoding.jsp" %>
<%
    // 3. 보내온 이메일 데이터 받기
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String email = request.getParameter("from");         // 보내는 이메일
    String phone = request.getParameter("phone");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String to = "soumunda8@naver.com";

    // smtp 설정 -> Properties 활용
    Properties p = new Properties();
    p.put("mail.smtp.host", "smtp.naver.com");                                      // smtp 서버명
    p.put("mail.smtp.port", "465");                                                 // smtp 포트번호
    p.put("mail.smtp.starttls.enable", "true");                                     // smtp 시작시 알려주게 설정
    p.put("mail.smtp.auth", "true");                                                // smtp 인증설정
    p.put("mail.smtp.debug", "true");                                               // smtp 디버긋 설정

    // Gmail 설정
    /*
    p.put("", "");
    p.put("", "");
    p.put("", "");
    */

    p.put("mail.smtp.socketFactory.port" , "465");                                  // smtp 소켓 포트 설정
    p.put("mail.smtp.socketFactory.class" , "javax.net.ssl.SSLSocketFactory");      // smtp 소켓 ssl 설정
    p.put("mail.smtp.socketFactory.fallback" , "false");                            // smtp 소켓 fallback 설정

    try {
        Authenticator auth = new SMTPAuthenticator();
        Session ses = Session.getInstance(p, auth);     // 인증하고 보낼 때 사용

        ses.setDebug(true);
        MimeMessage msg = new MimeMessage(ses);

        msg.setSubject(title); //  제목

        StringBuffer buffer = new StringBuffer();   //이메일 내용
        buffer.append("보내는 사람 : ");
        buffer.append(name+"\n");
        buffer.append("연락처 : ");
        buffer.append(phone+"\n");
        buffer.append("이메일 : ");
        buffer.append(email+"\n");
        buffer.append("제목 : ");
        buffer.append(title+"\n");
        buffer.append("내용 : ");
        buffer.append(content+"\n");

        Address fromAddr = new InternetAddress(id);     //보내는 사람
        msg.setFrom(fromAddr);

        Address toAddr = new InternetAddress(to);       // 받는 사람
        msg.addRecipient(Message.RecipientType.TO, toAddr);

        /* 여러 사람 보낼때
        String[] addrs = {"tes@nav.er", "jsdf@lsdf"};
        Address[] toAddrs = new InternetAddress[2];
        for(int i = 0;i < toAddrs.length; i++) {
            toAddrs[i] = new InternetAddress(addrs[i]);
        }
        msg.addRecipients(Message.RecipientType.TO, toAddrs);
        */

        msg.setContent(buffer.toString(), "text/html;charset=UTF-8");   // 단순한 내용 전달
        //msg.setText("이메일 내용");                                     // 이메일 내용이 텍스트로 전달됨
        Transport.send(msg); // 전송
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("이메일 전송 오류");
        return;
    } finally {
        response.sendRedirect("/index.jsp");
    }
%>