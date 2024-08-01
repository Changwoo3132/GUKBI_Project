package net.daum.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.daum.service.AdminService;
import net.daum.service.CartService;
import net.daum.service.MemberService;
import net.daum.vo.CartVO;
import net.daum.vo.KakaoPayProperties;
import net.daum.vo.MemberVO;

@RestController
public class PaymentController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private CartService cartService; // 추가

    @PostMapping("/payment/ready")
    public String kakaoPayReady(){

        try {
            URL kakao = new URL("http://open-api.kakaopay.com/face-recognition/face/compare");
            HttpURLConnection conn = (HttpURLConnection) kakao.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "SECRET_KEY PRD72D7A7DACB2BDF167CBF5D6F2F3F763CA2AEA");
            conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            conn.setDoOutput(true);
            String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=https://developers.kakao.com/success&fail_url=https://developers.kakao.com/fail&cancel_url=https://developers.kakao.com/cancel";
            OutputStream os = conn.getOutputStream();
            DataOutputStream dos = new DataOutputStream(os);
            dos.writeBytes(param);
            dos.close();

            int result = conn.getResponseCode();

            InputStream inputStream;
            if (result == 200) {
                inputStream = conn.getInputStream();
            }else{
                inputStream = conn.getErrorStream();
            }
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            return bufferedReader.readLine();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "{\"result\":\"NO\"}";
    }

    @GetMapping("payment")
    public ModelAndView payment(HttpServletResponse response, HttpSession session, HttpServletRequest request) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String id = (String) session.getAttribute("id");
        PrintWriter out = response.getWriter();

        if (id != null) {
            MemberVO m = memberService.mypage(id);
            List<CartVO> clist = cartService.getCartList(id); // Assume cartService is properly defined and injected
            ModelAndView mv = new ModelAndView();
            mv.addObject("totalPay", request.getParameter("totalPay"));
            mv.addObject("finalPay", request.getParameter("finalPay"));
            mv.addObject("m", m);
            mv.addObject("clist", clist);
            mv.setViewName("payment/payment");

            return mv;

        } else {
            out.println("<script>");
            out.println("alert('먼저 로그인을 해주세요!');");
            out.println("location='login';");
            out.println("</script>");
            return null;
        }
    }
}
