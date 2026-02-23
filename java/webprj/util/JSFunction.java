package webprj.util;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
   // msg의 값으로 alert을 띄우고, url 값의 위치로 페이지를 이동시킨다.
   // 이때 스크립트처럼 출력을 해야 하므로 출력 객체인 JspWriter 객체를 파라미터로 받는다
   // JspWriter: JSP에서 화면에 출력할 때 사용하는 객체
   // alertLocation: alert + 페이지 이동
   public static void alertLocation(String msg, String url, JspWriter out) {
      try {
         // 자바스크립트 코드 문자열을 만들기
         String script = " <script> alert(' " + msg + " '); " 
               + " location.href= ' " + url + " '; "
               + "</script>";
         out.println(script);
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   
   // msg 알럿 띄우고 이전 페이지로 돌아가도록 스크립트 작성
   // alertBack: alert + 뒤로가기
   public static void alertBack(String msg, JspWriter out) {
      try {
         String script = " <script> alert(' " + msg + " '); " 
               // history.back(): 브라우저 이전 페이지로 이동
               + " history.back();"
               + "</script>";
         out.println(script);
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   
}