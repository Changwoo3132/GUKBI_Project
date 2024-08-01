package net.daum.pwdconv;

import java.security.MessageDigest;

/* MD5 자바 비밀번호 암호화 */
public class PwdChange {

    public static String getPassWordToXEMD5String(String password){

        MessageDigest md_Md5 = null;

        try{
            md_Md5 = MessageDigest.getInstance("MD5");
        }catch(Exception e){
            e.printStackTrace();
        }
        String resultString;

        byte[] byteArr;

        String temp = "";

        byteArr = md_Md5.digest(password.getBytes());

        for(int i = 0; i < byteArr.length; i++){
            resultString = "" + Integer.toHexString((int)byteArr[i] & 0xFF);

            if(resultString.length() < 2){
                resultString = "0" + resultString;
            }
            temp = temp + resultString;
        }
        return temp;
    }
}
