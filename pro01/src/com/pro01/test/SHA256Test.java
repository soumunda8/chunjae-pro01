package com.pro01.test;

import com.pro01.util.SHA256;

import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class SHA256Test {

    public static void main(String[] args) throws NoSuchAlgorithmException {

        String pwd = "4321";
        String cryPwd = SHA256.encrypt(pwd);
        System.out.println("입력된 비밀번호는 [ " + pwd + " ]");
        System.out.println("암호화된 비밀번호는 [ " + cryPwd + " ]");

        Scanner sc = new Scanner(System.in);
        System.out.println("암호 입력 : ");
        String inPwd = sc.nextLine();
        String inCryPwd = SHA256.encrypt(inPwd);
        if(inCryPwd.equals(cryPwd)) {
            System.out.println("로그인 성공");
            System.out.println("입력된 암호와 일치합니다.");
        } else {
            System.out.println("로그인 실패");
            System.out.println("입력된 암호와 일치하지 않습니다.");
        }

    }

}