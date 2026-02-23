package webprj.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
   // 쿠키를 생성할 페이지에서 전달할 response 객체를 파라미터로 받고,
   // 쿠키 정보를 추가로 받아서 해당 response 객체를 통해 쿠키를 클라이언트에 전달한다.
   public static void CookieMake(HttpServletResponse response,
         String cName, String cValue, int cTime) {
      Cookie cookie = new Cookie(cName, cValue);
      cookie.setPath("/");
      cookie.setMaxAge(cTime);
      response.addCookie(cookie);
   }
   
   // 요청때 전달된 request 객체를 통해 쿠키를 얻어내고, 주어진 쿠키 정보를 get 한다.
   public static String readCookie(HttpServletRequest request, String cName) {
      // 쿠키가 없으면 빈 문자열 반환
      String cookieValue = "";
      
      Cookie[] cookies = request.getCookies();
      if(cookies != null) {
         for(Cookie c: cookies) {
            String cookieName = c.getName();
            if(cookieName.equals(cName)) {
               cookieValue = c.getValue();
            }
         }
      }
      return cookieValue;
   }
   
   // 쿠키 삭제 메서드 정의. 쿠키는 삭제될 쿠키의 maxAge 값을 0으로 세팅해서 response 해주면 됨
   public static void deleteCookie(HttpServletResponse response, String cName) {
      // 이름: cName, 값: "", 시간: 0초
      CookieMake(response, cName, "", 0);
   }
   
}