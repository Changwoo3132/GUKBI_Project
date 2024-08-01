package net.daum.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.daum.service.AdminService;
import net.daum.service.CartService;
import net.daum.service.MemberService;
import net.daum.vo.CartVO;
import net.daum.vo.MemberVO;
import net.daum.vo.ProductVO;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private MemberService memberService;

    // 상품 리스트 보기
    @GetMapping("product")
    public ModelAndView product(HttpServletResponse response, HttpSession session,
                                @RequestParam(value="category", required = false) String category) throws Exception{
        response.setContentType("text/html;charset=UTF-8");

        ModelAndView mv = new ModelAndView();

        List<ProductVO> plist = null;

        if(category.equals("top")) {
            plist = this.cartService.getTopList();
        }else if(category.equals("bottom")) {
            plist = this.cartService.getBottomList();
        }else if(category.equals("outer")) {
            plist = this.cartService.getOuterList();
        }else if(category.equals("shoes")) {
            plist = this.cartService.getShoesList();
        }
        mv.addObject("plist", plist);
        mv.addObject("category", category);

        mv.setViewName("cart/product");
        return mv;
    }

    // 상품 세부정보 보기
    @GetMapping("detail")
    public ModelAndView detail(HttpServletResponse response, HttpSession session, @RequestParam(value="mid", required
            = false) String mid, Integer procode) throws Exception{
        response.setContentType("text/html;charset=UTF-8");

        ProductVO pro = this.adminService.getProductCont(procode); // 상품코드 기준으로 상품정보 가져오기

        ModelAndView mv = new ModelAndView();
        mv.addObject("pro", pro);
        mv.addObject("procode", procode);
        mv.setViewName("cart/detail");
        return mv;
    }

 // 결제 페이지
    /*@GetMapping("payment")
    public ModelAndView payment(HttpServletResponse response, HttpSession session, HttpServletRequest request
          ) throws Exception {
       response.setContentType("text/html;charset=UTF-8");
       String id = (String) session.getAttribute("id");
       PrintWriter out = response.getWriter();
       

       if (id != null) {
          
          MemberVO m = this.memberService.mypage(id);
           //System.out.println("totalPay: " + totalPay); // 로그 출력
          List<CartVO> clist = this.cartService.getCartList(id);
          ModelAndView mv = new ModelAndView();
          mv.addObject("totalPay", request.getParameter("totalPay")); // Add totalPay to the model
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
    }*/

    // 장바구니 담기
    @PostMapping("basket_put")
    public ModelAndView basket_put(HttpServletRequest request, HttpSession session, HttpServletResponse response,
          CartVO c, @RequestParam("procode") Integer procode) throws Exception {
       response.setContentType("text/html;charset=UTF-8");
       String id = (String) session.getAttribute("id");
       PrintWriter out = response.getWriter();

       if (id != null) {
          c.setMid(id);
          c.setProcode(procode);
          this.cartService.insertCart(c);

          out.println("<script>");
          out.println("alert('장바구니 창으로 이동하시겠습니까?');");
          out.println("location='basket';");
          out.println("</script>");
       } else {
          out.println("<script>");
          out.println("alert('먼저 로그인을 해주세요!');");
          out.println("location='login';");
          out.println("</script>");
       }
       return null;
    }

    /* 장바구니 페이지 */
    @GetMapping("basket")
    public ModelAndView basket(HttpSession session, HttpServletResponse response, HttpServletRequest request)
          throws Exception {
       response.setContentType("text/html;charset=UTF-8");
       String id = (String) session.getAttribute("id");
       PrintWriter out = response.getWriter();

       if (id != null) {
          // 회원아이디를 기준으로 장바구니 담은 상품 가져오기
          List<CartVO> clist = this.cartService.getCartList(id);

          // 회원아이디를 기준으로 장바구니코드 가져오기
          List<CartVO> cartcode = this.cartService.getCartcode(id);
          
         

          ModelAndView mv = new ModelAndView();
          mv.addObject("clist", clist);
          mv.addObject("cartcode", cartcode);
          mv.addObject("id", id);
          mv.setViewName("/cart/basket");
          
          return mv;
       } else {
          out.println("<script>");
          out.println("alert('먼저 로그인을 해주세요!');");
          out.println("location='login';");
          out.println("</script>");
       }
       return null;
    }

    // 장바구니 상품 삭제
    @GetMapping("basket_del")
    public ModelAndView basket_del(@RequestParam("cartcode") Integer cartcode) {

       this.cartService.delCart(cartcode);

       ModelAndView mv = new ModelAndView();
       mv.setViewName("redirect:/basket");
       return mv;
    }
/*-------------------------------------------------------------*/

    /* 반복적인 코드 하나로 줄이기 */
    public static boolean islogin(HttpSession session, HttpServletResponse response) throws Exception {

       PrintWriter out = response.getWriter();
       String id = (String) session.getAttribute("id");

       if (id != null) {
          out.println("<script>");
          out.println("alert('다시 로그인 하세요';");
          out.println("location='login';");
          out.println("</script>");
       }
       return true;
    }
 }
