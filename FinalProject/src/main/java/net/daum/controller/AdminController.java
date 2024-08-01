package net.daum.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.daum.pwdconv.PwdChange;
import net.daum.service.AdminService;
import net.daum.service.CenterService;
import net.daum.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
    
    @Autowired
    private CenterService centerService;

    /* 관리자 로그인 페이지 */
    @GetMapping("/adminlogin")
    public ModelAndView adminlogin() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_login");

        return mv;
    }

    /* 관리자 로그인 인증 */
    @PostMapping("admin_login_ok")
    public ModelAndView adminloginOk(AdminVO a, HttpServletResponse response, HttpSession session) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
//        a.setAdminpwd("12345"); /* 암호화 시키기 위해서 먼저 기입 */
        a.setAdminpwd(PwdChange.getPassWordToXEMD5String(a.getAdminpwd()));

        /* DB에 관리자 아이디 비밀번호를 넘기기 위한 코드 4줄 */
//        a.setAdminname("관리자");
//        a.setAdminid("admin");
//        this.adminService.insertAdmin(a);

        AdminVO admin_info = this.adminService.adminLogin(a.getAdminid());

        if (admin_info == null) {
            out.println("<script>");
            out.println("alert('관리자 정보가 없습니다!');");
            out.println("history.go(-1);");
            out.println("</script>");
        } else {
            if (!admin_info.getAdminpwd().equals(a.getAdminpwd())) {
                out.println("<script>");
                out.println("alert('관리자 비번이 다릅니다!');");
                out.println("history.back();");
                out.println("</script>");
            } else {
                session.setAttribute("admin_id", a.getAdminid());
                //admin_id 세션 아이디 키이름에 관리자 아이디 저장
                session.setAttribute("admin_name", admin_info.getAdminname());

                return new ModelAndView("redirect:/adminindex");
                //생성자 인자값으로 뷰페이지 경로나 매핑주소 경로가 들어간다. 관리자 로그인 인증후
                //관리자 메인 매핑 주소로 이동
            }
            return null;
        }
        return null;
    }

    /* 관리자 로그인 인증후 메인 화면 */
    @GetMapping("/adminindex")
    public ModelAndView admin_index(HttpServletResponse response,
                                    HttpSession session) throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String admin_id = (String)session.getAttribute("admin_id");//관리자 세션아이디를 구함

        if(admin_id == null) {
            out.println("<script>");
            out.println("alert('관리자 아이디로 다시 로그인 하세요!');");
            out.println("location='adminlogin';");
            out.println("</script>");

        }else {
            return new ModelAndView("admin/admin_main");
            //생성자 인자값으로 관리자 메인 뷰페이지 경로설정
        }
        return null;
    }

    /* 관리자 로그아웃 */
    @PostMapping(value="/adminlogout")
    public ModelAndView admin_logOut(HttpServletResponse response,
                                     HttpSession session) throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        session.invalidate();//세션 만료 => 관리자 로그아웃

        out.println("<script>");
        out.println("alert('관리자 로그아웃 되었습니다!');");
        out.println("location='adminlogin';");
        out.println("</script>");

        return null;
    }

    /* AdminMemberController */
    @GetMapping("/memberlist")
    public ModelAndView MemberList(HttpServletResponse response, HttpSession session, PageVO p, HttpServletRequest request) throws Exception {

        response.setContentType("text/html;charset=utf-8");

        if(isLogin(session, response)){
            int page = 1;
            int limit = 10;

            if(request.getParameter("page") != null) {
                page=Integer.parseInt(request.getParameter("page"));
            }

            String find_name = request.getParameter("find_name");
            String find_field = request.getParameter("find_field");
            p.setFind_name("%"+find_name+"%");

            p.setFind_field(find_field);

            int memberCount = this.adminService.getRowCount(p);

            p.setStartrow((page-1)*7+1);
            p.setEndrow(p.getStartrow()+limit-1);

            List<MemberVO> mlist=this.adminService.getMemberList(p);

            /* 페이징 연산 */
            int maxpage = (int)((double)memberCount/limit+0.95);
            int startpage = (((int)((double)page/10+0.9))-1)*10+1;

            int endpage = maxpage;
            if(endpage > startpage+10-1) endpage = startpage+10-1;

            ModelAndView listM = new ModelAndView();
            listM.addObject("mlist", mlist);
            listM.addObject("page", page);
            listM.addObject("startpage", startpage);
            listM.addObject("endpage", endpage);
            listM.addObject("maxpage", maxpage);
            listM.addObject("memberCount", memberCount);
            listM.addObject("find_field", find_field);
            listM.addObject("find_name", find_name);

            listM.setViewName("admin/admin_member_list");

            return listM;
        }
        return null;
    }

    /* 회원 상세 정보 보기 */
    @GetMapping("/memberinfo")
    public ModelAndView MemberInfo(String mid, HttpServletResponse response, HttpSession session, int page, String state) throws Exception {

        response.setContentType("text/html;charset=utf-8");

        if(isLogin(session, response)){
            MemberVO m = this.adminService.getMemberInfo(mid);

            ModelAndView mv = new ModelAndView();
            mv.addObject("m", m);
            mv.addObject("page", page);

            if(state.equals("info")){
                mv.setViewName("admin/admin_member_info");
            }
            return mv;
        }
        return null;
    }

    /* 회원 삭제 */
    @GetMapping("/memberdel")
    public ModelAndView MemberDel(String mid, HttpServletResponse response, HttpSession session, int page) throws Exception {

        response.setContentType("text/html;charset=utf-8");

        if(isLogin(session, response)){
            this.adminService.memberDel(mid);

            ModelAndView mv = new ModelAndView();

            mv.setViewName("redirect:/memberlist");

            return mv;
        }
        return null;
    }

    /* AdminNoticeController */
    /* 관리자 공지사항 목록 */
    @GetMapping("/admin_notice")
    public ModelAndView notice(PageVO p, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=utf-8");

        if (isLogin(session, response)){
            int page = 1;
            int limit = 10;
            if(request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));

            }
            String find_name = request.getParameter("find_name");//검색어
            String find_field = request.getParameter("find_field");//검색필드
            p.setFind_field(find_field);
            p.setFind_name("%"+find_name+"%");
            int listCount = this.adminService.getListCount(p);
            //검색전후 게시물 수

            /* 페이징 */
            p.setStartrow((page-1)*limit+1);//시작 번호
            p.setEndrow(p.getStartrow()+limit-1);//끝행 번호

            List<NoticeVO> glist = this.adminService.getNoticeList(p);
            //검색전후 공지목록

            /* 페이징 연산 */
            int maxpage = (int)((double)listCount/limit+0.95);//총페이지수
            int startpage = (((int)((double)page/10+0.9))-1)*10+1;
            //현재 페이지에 보여질 시작페이지
            int endpage = maxpage;//현재 페이지에 보여질 마지막 페이지
            if(endpage > startpage+10-1) endpage = startpage+10-1;	 /* 페이징 연산 */

            ModelAndView listM = new ModelAndView();
            listM.addObject("glist", glist);
            listM.addObject("listcount", listCount);
            listM.addObject("page", page);
            listM.addObject("startpage", startpage);
            listM.addObject("endpage", endpage);
            listM.addObject("maxpage", maxpage);
            listM.addObject("find_field", find_field);
            listM.addObject("find_name", find_name);

            listM.setViewName("admin/admin_notice_list");
            return listM;
        }

        return null;
    }

    /* 공지사항 작성 */
    @GetMapping("notice_write")
    public String notice_write(int page, HttpServletResponse response, HttpSession session, Model m) throws Exception {

        response.setContentType("text/html;charset=utf-8");

        if (isLogin(session, response)){
            m.addAttribute("page", page);
            return "admin/admin_notice_write";
        }
        return null;
    }

    /* 공지사항 저장 */
    @PostMapping("notice_write_ok")
    public ModelAndView notice_write_ok(NoticeVO n, HttpServletResponse response, HttpSession session) throws Exception {

        response.setContentType("text/html;charset=utf-8");

        if (isLogin(session, response)){
            this.adminService.insertNotice(n);

            ModelAndView mv = new ModelAndView();
            mv.setViewName("redirect:/admin_notice");

            return mv;
        }
        return null;
    }

    /* 공지사항 내용 & 수정 */
    @GetMapping("/notice_cont")
    public ModelAndView notice_cont(int no, int page, String state, HttpServletResponse response, HttpSession session) throws Exception {

        response.setContentType("text/html;charset=utf-8");

        if (isLogin(session, response)){
            NoticeVO n = this.adminService.contNotice(no);
            String n_cont = n.getNotice_cont().replace("\n", "<br>");

            ModelAndView mv = new ModelAndView();
            mv.addObject("n", n);
            mv.addObject("n_cont", n_cont);
            mv.addObject("page", page);

            if(state.equals("cont")){
                mv.setViewName("admin/admin_notice_cont");
            }else if(state.equals("edit")){
                mv.setViewName("admin/admin_notice_edit");
            }

            return mv;
        }
        return null;
    }

    /* 공지사항 수정 */
    @PostMapping("/notice_edit_ok")
    public ModelAndView notice_edit_ok(NoticeVO n, int no, int page, HttpServletResponse response, HttpSession session) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        if (isLogin(session, response)){
            n.setNotice_no(no);
            this.adminService.editNotice(n);

            ModelAndView mv = new ModelAndView();
            mv.addObject("no", no);
            mv.addObject("state","cont");
            mv.addObject("page", page);
            mv.setViewName("redirect:/notice_cont");

            return mv;
        }
        return null;
    }

    /* 공지사항 삭제 */
    @GetMapping("/notice_del_ok")
    public String notice_del_ok(int no, int page, HttpServletResponse response, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=utf-8");

        if (isLogin(session, response)){

            this.adminService.delNotice(no);

            return "redirect:/admin_notice?page="+page;
        }
        return null;
    }

    /* ProductController */
    @GetMapping("/admin_product_write")
    public ModelAndView admin_product_write(HttpServletResponse response, HttpSession session, HttpServletRequest request)
            throws Exception{

        response.setContentType("text/html;charset=UTF-8");

        if(isLogin(session, response)) {
            int page = 1;
            if(request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            ModelAndView wm = new ModelAndView();
            wm.setViewName("admin/admin_product_write"); //
            wm.addObject("page", page); // 메서드 인자값으로 뷰페이지 경로와 파일명 => /WEB-INF/views/bbs/bbs_write.jsp

            return wm;
        }
        return null;
    }

    @PostMapping("/admin_product_write_ok")
    public String admin_product_write_ok(HttpServletResponse response, HttpSession session, ProductVO pro, Product2VO pro2
            , HttpServletRequest request) throws Exception{
        response.setContentType("text/html;charset=UTF-8");

        if(isLogin(session, response)) {

            String uploadFolder = request.getSession().getServletContext().getRealPath("upload");
            // 첨부파일 입로드 실제 경로를 구함

            MultipartFile uploadFile = pro2.getUploadFile(); // 첨부파일을 가져옴

            if(!uploadFile.isEmpty()) { // 첨부파일이 있는 경우 실행

                String fileName = uploadFile.getOriginalFilename(); //첨부원본파일명
                Calendar c = Calendar.getInstance(); // 캘린더는 추상클래스로 new로 객체생성 못함.
                // 하지만 년원일 시분초 값을 반환할 때는 유용하게 사용
                int year = c.get(Calendar.YEAR);
                int month = c.get(Calendar.MONTH)+1; // 월값, +1을 하는 이유는 1월이 0으로 반환되기 때문이다.
                int date = c.get(Calendar.DATE);

                String homedir = uploadFolder +"/" + year + "-" + month + "-" + date; // 오늘날짜 폴더경로 저장
                File path01 = new File(homedir);

                if(!(path01.exists())) { // 오늘날짜 폴더경로가 존해하지 않으면
                    path01.mkdir(); // 오늘날짜 폴더를 생성
                }
                Random r = new Random(); // 랜덤클래스는 난수를 발생
                int random = r.nextInt(100000000); // 0이상 1억미만 사이의 정수숫자 난수발생

                /* 첨부파일 확장자를 구함 */
                int index = fileName.lastIndexOf("."); // 마침표를 맨오른쪽부터 찾아서 가장 먼저 나오는 해당문자위치 번호를 맨
                // 왼쪽부터 카운터해서 반환, 첫 문자는 0부터 시작
                String fileExtendsion = fileName.substring(index+1); // 마침표 이후부터 마지막 문자까지 구함. 첨부파일 확장자
                String refileName = "product" + year + month + date + random + "." + fileExtendsion;
                // 새로운 파일명 저장
                String fileDBName = "/" + year + "-" + month + "-" + date + "/" +refileName;
                // 데이터베이스에 저장될 레코드값

                pro.setProfile(fileDBName);

                File saveFile = new File(homedir + "/", refileName);

                try {
                    uploadFile.transferTo(saveFile); // upload 폴더 오늘날짜 폴더에 변경된 파일로 실제 업로드
                }catch(Exception e) {e.printStackTrace();}
            }else { // 파일을 첨부하지 않았을때 실행
                String fileDBName = "";
                pro.setProfile(fileDBName);
            }// if else

            this.adminService.insertProduct(pro); // 자료실 저장

            return "redirect:/admin_product_category"; // 자료실 목록 매핑주소로 이동, redirect:/ 로 이동하는 방식은 get방식이다.
        }
        return null;
    }

    // 카테고리 상의 + 하의 + 아우터 + 신발 리스트 보기 폼
    @GetMapping("admin_product_category")
    public ModelAndView admin_product_category(HttpServletResponse response, HttpSession session
            , HttpServletRequest request, @RequestParam(value="category", required = false) String category
            , @RequestParam(value="page", required = false, defaultValue = "1") Integer page) throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        if(isLogin(session, response)) {

            ModelAndView mv = new ModelAndView();
            mv.addObject("category", category);
            mv.addObject("page", page);
            mv.setViewName("/admin/admin_product_category");
            return mv;
        }
        return null;
    }

    // 카테고리 별 상품 목록
    @GetMapping("admin_product_list")
    public ModelAndView admin_product_list(HttpServletResponse response, 
    		HttpSession session, HttpServletRequest request
            , PageVO p) throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        if(isLogin(session, response)) {

            int page = 1; // 현재쪽번호
            int limit = 10; // 현재페이지에 보여지는 목록개수, 한페이지에 10개 목록이 보여주는 페이징
            if(request.getParameter("page") != null && !request.getParameter("page").isEmpty() ) {
                page = Integer.parseInt(request.getParameter("page"));
                // get으로 전달된 쪽번호를 정수숫자로 변경해서 저장
            }else if(request.getParameter("page") == null) {
                page = 1;
            }

            String find_name = request.getParameter("find_name"); //검색어
            String find_field = request.getParameter("find_field"); // 검색필드
            p.setFind_field(find_field);
            p.setFind_name("%"+find_name+"%");

            int totalCount = 0; // 리스트별 총 개수

            List<ProductVO> plist = null; // 리스트 객체

            String category = request.getParameter("category"); // 카테고리 파라미터

            System.out.println(category);
            System.out.println(find_field);
            System.out.println(find_name);

            if (category != null && !category.isEmpty()) { // null값 예외처리
                if (category.equals("top")) {
                    totalCount = this.adminService.getTopCount(p); // 상의 레코드 개수
                    /* 페이징(쪽나누기) 관련 코드 */
                    p.setStartrow((page-1)*10+1); // 시작행번호
                    p.setEndrow(p.getStartrow()+limit-1); // 끝행번호
                    plist = this.adminService.getTopList(p); // 상의 리스트 가져오기

                } else if (category.equals("bottom")) {
                    totalCount = this.adminService.getBottomCount(p);
                    /* 페이징(쪽나누기) 관련 코드 */
                    p.setStartrow((page-1)*10+1); // 시작행번호
                    p.setEndrow(p.getStartrow()+limit-1); // 끝행번호
                    plist = this.adminService.getBottomList(p);

                } else if (category.equals("outer")) {
                    totalCount = this.adminService.getOuterCount(p);
                    /* 페이징(쪽나누기) 관련 코드 */
                    p.setStartrow((page-1)*10+1); // 시작행번호
                    p.setEndrow(p.getStartrow()+limit-1); // 끝행번호
                    plist = this.adminService.getOuterList(p);

                } else if (category.equals("shoes")) {
                    totalCount = this.adminService.getShoesCount(p);
                    /* 페이징(쪽나누기) 관련 코드 */
                    p.setStartrow((page-1)*10+1); // 시작행번호
                    p.setEndrow(p.getStartrow()+limit-1); // 끝행번호
                    plist = this.adminService.getShoesList(p);

                }
            }

            /* 페이지 연산 */
            int maxpage=(int)((double)totalCount/limit+0.95); // 총 페이지
            int startpage=(((int)((double)page/10+0.9))-1)*10+1; // 현재 페이지에 보여질 시작 페이지
            int endpage=maxpage;

            if(endpage > startpage+10-1) endpage=startpage+10-1;



            ModelAndView mv = new ModelAndView();
            mv.addObject("category", category);
            mv.addObject("totalCount", totalCount);
            mv.addObject("plist", plist); // 목록
            mv.addObject("page", page); // 현재 쪽번호
            mv.addObject("startpage", startpage); // 시작 페이지
            mv.addObject("endpage", endpage); // 마지막 페이지
            mv.addObject("maxpage", maxpage); // 최대 페이지
            mv.addObject("find_field", find_field); // 검색필드
            mv.addObject("find_name", find_name); // 검색어
            mv.setViewName("admin/admin_product_list");
            return mv;
        }
        return null;
    }

    // 상품정보폼 + 수정폼 + 삭제폼
    @RequestMapping("/admin_product_cont")
    public ModelAndView admin_product_cont(Integer procode, @RequestParam("page") Integer page
            , @RequestParam("state") String state, @RequestParam("category") String category, ProductVO pro) {

        pro = this.adminService.getProductCont(procode); // 상품코드 가져오기

        String proinfo= pro.getProinfo().replace("\n", "<br>"); //textarea에서 엔터키를 친 부분을 줄바꿈 처리

        ModelAndView cm = new ModelAndView();

        if(state.equals("cont")) { // 내용보기 일때
            cm.setViewName("admin/admin_product_cont");
        }else if(state.equals("edit")) {
            cm.setViewName("admin/admin_product_edit");
        }else if(state.equals("del")) {
            cm.setViewName("admin/admin_product_del");
        }
        cm.addObject("pro", pro);
        cm.addObject("page", page);
        cm.addObject("proinfo", proinfo);
        cm.addObject("category", category);
        cm.addObject("page", page);

        return cm;
    }

    // 수정 완료
    @PostMapping("/admin_product_edit_ok")
    public ModelAndView admin_product_edit_ok(HttpServletResponse response, HttpSession session
            , ProductVO pro, Product2VO pro2, HttpServletRequest request)throws Exception {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); // 출력스트림 out생성

        if(isLogin(session, response)) {
            String uploadFolder = request.getSession().getServletContext().getRealPath("upload");
            // 수정첨부된 파일이 실제 업로드 될 경로
            MultipartFile uploadFile = pro2.getUploadFile(); // 수정 첨부된 파일을 가져옴.

            int page = 1;
            if(request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            if(!uploadFile.isEmpty()) { // 수정 첨부된 파일이 있다면

                String fileName = uploadFile.getOriginalFilename(); // 수정 펌부 파일명을 구함
                File delFile = new File(uploadFolder+pro.getProfile()); // 삭제할 파일 객체 생성
                if(delFile.exists()) { // 삭제할 파일이 있다면
                    delFile.delete(); // 기존 첨부파일을 삭제
                }
                Calendar c = Calendar.getInstance();
                int year = c.get(Calendar.YEAR); // 년
                int month = c.get(Calendar.MONTH)+1; // 월
                int date = c.get(Calendar.DATE); // 일

                String homedir = uploadFolder + "/" + year + "-" + month + "-" + date;
                // 오늘날짜 폴더 경로 저장
                File path01 = new File(homedir);
                if(!(path01.exists())) {
                    path01.mkdir(); // 오늘날짜 폴더 생성
                }
                Random r = new Random();
                int random = r.nextInt(100000000);

                /* 첨부파일 확장자 */
                int index = fileName.lastIndexOf(".");
                String fileExtendsion = fileName.substring(index+1);
                String refileName = "product" + year + month + date + random + "." + fileExtendsion;
                // 새로운 이진파일명
                String fileDBName = "/" + year + "-" + month + "-" + date + "/" +refileName; // db에 저장된 레코드값

                pro.setProfile(fileDBName);

                File saveFile = new File(homedir + "/" , refileName);

                try {
                    uploadFile.transferTo(saveFile);
                }catch(Exception e) {e.printStackTrace();}
            }else { // 수정 첨부하지 않았을때
                String fileDBName = "";
                if(pro.getProfile() != null) { // 기존 파일이 있다면
                    pro.setProfile(pro.getProfile());
                }else {
                    pro.setProfile(fileDBName);
                }
            } // if else

            this.adminService.editProduct(pro); // 수정

            String category = request.getParameter("category");

            ModelAndView em = new ModelAndView("redirect:/admin_product_cont");
            em.addObject("procode", pro.getProcode());
            em.addObject("category", category);
            em.addObject("page", page);
            em.addObject("state", "cont");
            return em;
        }

        return null;
    }

    // 삭제완료
    @PostMapping("/admin_product_del_ok")
    public ModelAndView admin_product_del_ok(HttpServletResponse response, 
    		HttpSession session, HttpServletRequest
            request, Integer procode, int page, ProductVO pro, 
            String category)
            throws Exception {

        response.setContentType("text/html;charset=UTF-8");

        if(isLogin(session, response)) {
            String uploadFolder = request.getSession().getServletContext().getRealPath("upload");

            procode = pro.getProcode();

            this.adminService.delProduct(procode); // 상품코드를 기준으로 삭제

            if(pro.getProfile() != null) {// 기존 첨부파일이 있다면
                File delFile = new File(uploadFolder + pro.getProfile()); // 삭제 파일 객체 생성

                delFile.delete(); // 폴더는 삭제 안되고 기존 첨부파일만 삭제된다.
            }
            ModelAndView mv = new ModelAndView();
            mv.addObject("category", category);
            mv.addObject("page", page);
            mv.setViewName("redirect:/admin_product_list");
            return mv;
        }

        return null;
    }

    /* bbsController */
    //관리자 상품문의
    @RequestMapping("/admin_userbbs_list")
    public ModelAndView admin_userbbs_list(HttpServletRequest request, 
    		BbsVO b, PageVO p) {
        int page = 1;
        int limit = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String find_name = request.getParameter("find_name");
        String find_field = request.getParameter("find_field");
        p.setFind_field(find_field);
        p.setFind_name("%" + find_name + "%");

        // 전체 글의 총 개수를 가져옵니다.
        int totalCount = this.adminService.getTotalCount(p);

        p.setStartrow((page - 1) * limit + 1);
        p.setEndrow(p.getStartrow() + limit - 1);

        // 글 목록을 가져옵니다.
        List<BbsVO> blist = this.adminService.getUserBbsList(p);

        // 최대 페이지 수 계산
        int maxpage = (int) ((double) totalCount / limit + 0.95);
        int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
        int endpage = maxpage;

        if (endpage > startpage + 10 - 1)
            endpage = startpage + 10 - 1;

        // 원본글 총 개수를 가져옵니다.
        int totalOriginalCount = this.adminService.getTotalOriginalCount(p);

        // 글 번호 계산 (내림차순으로 계산하고 최소값 1로 유지)
        int startNumber = totalOriginalCount - (page - 1) * limit;
        if (startNumber < 1) {
            startNumber = 1;
        }

        ModelAndView listM = new ModelAndView("admin/admin_userbbs_list");
        listM.addObject("totalCount", totalCount);
        listM.addObject("blist", blist);
        listM.addObject("page", page);
        listM.addObject("startpage", startpage);
        listM.addObject("endpage", endpage);
        listM.addObject("maxpage", maxpage);
        listM.addObject("find_field", find_field);
        listM.addObject("find_name", find_name);
        listM.addObject("startNumber", startNumber);

        return listM;
    }
    
    @PostMapping("/admin_userbbs_del_ok")
    public String admin_userbbs_del_ok(int bbs_no, int page, 
            HttpServletResponse response, HttpServletRequest request) 
                    throws Exception {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uploadFolder = request.getSession().getServletContext().getRealPath("upload");

        // 로그 추가
        System.out.println("삭제 요청 받음: bbs_no=" + bbs_no + ", page=" + page);

        BbsVO db_bbs = this.centerService.getBbsCont(bbs_no);

        if(db_bbs == null){
            out.println("<script>");
            out.println("alert('해당 게시물이 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
        }

        this.centerService.delBbs(bbs_no);

        if(db_bbs.getBbs_file() != null) {
            File delFile = new File(uploadFolder + db_bbs.getBbs_file());
            if(delFile.exists()) {
                delFile.delete();
            }
        }

        // 삭제 후 리다이렉트 URL 로그
        String redirectUrl = "redirect:/admin_userbbs_list?page=" + page;
        System.out.println("리다이렉트 URL: " + redirectUrl);

        return redirectUrl;

    }


    /* 반복적인 코드 하나로 줄이는 코드 */
    public static boolean isLogin(HttpSession session, HttpServletResponse response) throws Exception{
        PrintWriter out=response.getWriter();
        String admin_id=(String)session.getAttribute("admin_id");
        //세션 아이디값을 구함

        if(admin_id == null) {
            out.println("<script>");
            out.println("alert('관리자로 다시 로그인 하세요!');");
            out.println("location='adminlogin';");
            out.println("</script>");

            return false;
        }
        return true;
    }
}
