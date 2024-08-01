package net.daum.controller;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.daum.pwdconv.PwdChange;
import net.daum.service.MemberService;
import net.daum.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    /* 메인 페이지 */
    @GetMapping("/index")
    public ModelAndView index() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");

        return mv;
    }// index()

    /* 로그인 페이지 */
    @GetMapping("/login")
    public ModelAndView login(HttpSession session, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String id = (String) session.getAttribute("id");

        if (islogin(session, response)) {

            MemberVO m = this.memberService.mypage(id);

            ModelAndView mv = new ModelAndView();
            mv.addObject("m", m);
            mv.setViewName("/join/shoplogin");

            return mv;
        }
        return null;
    }// login()

    /* 회원가입 페이지 */
    @GetMapping("/register")
    public ModelAndView join() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/join/shopjoin");

        return mv;
    }// join()

    /* 회원가입 저장 */
    @PostMapping("/resgisterok")
    public ModelAndView joinOK(MemberVO m) {

        m.setMpwd(PwdChange.getPassWordToXEMD5String(m.getMpwd()));
        m.setMpwdC(PwdChange.getPassWordToXEMD5String(m.getMpwdC()));

        this.memberService.joinmember(m);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/login");

        return mv;
    }// joinOK()

    /* 로그인 인증 */
    @PostMapping("/loginok")
    public String loginOK(String mid, String mpwd, HttpSession session, HttpServletResponse response) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        /* 아이디와 m_state=1 인 경우만 로그인 인증 처리 */
        MemberVO s = this.memberService.logincheck(mid);

        if (s == null) {
            out.println("<script>");
            out.println("alert('등록이 안된 아이디 입니다');");
            out.println("history.back();");
            out.println("</script>");
        } else {
            if (!s.getMpwd().equals(PwdChange.getPassWordToXEMD5String(mpwd))) {
                out.println("<script>");
                out.println("alert('비밀번호가 다릅니다');");
                out.println("history.back();");
                out.println("</script>");
            } else {
                session.setAttribute("id", mid);
                return "redirect:/index";
            }// if ~ else
        }// if ~ else
        return null;
    }// LoginOK()

    /* 로그아웃 */
    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session, HttpServletResponse response) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        session.invalidate();

        out.println("<script>");
        out.println("alert('로그아웃 했습니다');");
        out.println("location='login';");
        out.println("</script>");

        return null;
    }// logout()

    /* 정보 수정 페이지  */
    @GetMapping(value = "/memberedit")
    public ModelAndView memberEdit(HttpServletResponse response, HttpSession session) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        String id = (String) session.getAttribute("id");

        if (islogin(session, response)) {

            MemberVO m = this.memberService.mypage(id);

            ModelAndView mv = new ModelAndView();
            mv.addObject("m", m);
            mv.setViewName("/join/memberedit");

            return mv;
        }
        return null;
    }

    /* 정보 수정 저장 */
    @PostMapping("/membereditok")
    public ModelAndView memberEditOK(MemberVO m, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        this.memberService.usereditok(m);

        out.println("<script>");
        out.println("alert('수정되었습니다');");
        /* 부모 창 새로고침 후 창 닫고 Login 페이지로 이동 */
        out.println("window.opener.location.reload()");
        out.println("window.close()");
        out.println("window.opener.location.href='/login';");
        out.println("</script>");

        out.flush();

        return null;
    }

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
