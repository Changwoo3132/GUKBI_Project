package net.daum.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.daum.service.CenterService;
import net.daum.vo.Bbs2VO;
import net.daum.vo.BbsVO;
import net.daum.vo.NoticeVO;
import net.daum.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

@Controller
public class CenterController {

    @Autowired
    private CenterService centerService;

    /* 고객센터 페이지 이동 */
    @GetMapping("/question")
    public ModelAndView question() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/center/question");

        return mv;
    }

    @GetMapping("askcenter")
    public ModelAndView askCenter(HttpServletRequest request, BbsVO b, PageVO p) {
        int page=1;
        int limit=10;

        if(request.getParameter("page")!=null){
            page=Integer.parseInt(request.getParameter("page"));
        }

        String find_name = request.getParameter("find_name");
        String find_field = request.getParameter("find_field");
        p.setFind_name("%" + find_name + "%");
        p.setFind_field(find_field);

        int totalCount = this.centerService.getTotalCount(p);

        p.setStartrow((page - 1) * limit + 1);
        p.setEndrow(p.getStartrow() + limit - 1);

        List<BbsVO> blist = this.centerService.BbsList(p);
        int listcount = blist.size();

        int maxpage = (int) ((double) totalCount / limit + 0.95);
        int startpage = (((int) ((double) page / 10 + 0.9)) -1) * 10 + 1;
        int endpage = maxpage;

        if(endpage > startpage + 10 - 1){
            endpage = startpage + 10 - 1;
        }

        int startNumber = totalCount - (page - 1) * limit;

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/bbs/bbs_list");
        mv.addObject("blist", blist);
        mv.addObject("totalCount", totalCount);
        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage", endpage);
        mv.addObject("maxpage", maxpage);
        mv.addObject("startnumber", startNumber);
        mv.addObject("listcount", listcount);
        mv.addObject("find_name", find_name);
        mv.addObject("find_field", find_field);

        return mv;
    }

    /* NoticeController*/
    @GetMapping("notice")
    public ModelAndView notice(HttpServletRequest request,BbsVO b, PageVO p) {
        int page = 1;
        int limit = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<NoticeVO> nlist = this.centerService.getNoticeList();
        int listcount = nlist.size();
        
        String find_name = request.getParameter("find_name");
        String find_field = request.getParameter("find_field");
        p.setFind_name("%" + find_name + "%");
        p.setFind_field(find_field);

        int totalCount = this.centerService.getTotalCount(p);

        p.setStartrow((page - 1) * limit + 1);
        p.setEndrow(p.getStartrow() + limit - 1);     

        int maxpage = (int) ((double) totalCount / limit + 0.95);
        int startpage = (((int) ((double) page / 10 + 0.9)) -1) * 10 + 1;
        int endpage = maxpage;

        if(endpage > startpage + 10 - 1){
            endpage = startpage + 10 - 1;
        }

        int startNumber = totalCount - (page - 1) * limit;

        ModelAndView mv = new ModelAndView();
         
        mv.addObject("totalCount", totalCount);
        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage", endpage);
        mv.addObject("maxpage", maxpage);
        mv.addObject("startnumber", startNumber);
        mv.addObject("listcount", listcount);
        mv.addObject("find_name", find_name);
        mv.addObject("find_field", find_field);    
        mv.addObject("nlist", nlist);
        mv.addObject("page", page); 
        mv.setViewName("/center/notice");

        return mv;
    }


    @GetMapping("user_notice_cont")
    public ModelAndView notice_cont(int notice_no) {

        NoticeVO n = this.centerService.getNoticeCont(notice_no);
        String n_cont = n.getNotice_cont().replace("\n", "<br>");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/center/notice_cont");
        mv.addObject("n", n);
        mv.addObject("n_cont", n_cont);

        return mv;
    }

    /* BbsController */
    /* 사용자 자료실 글쓰기 폼 */
    @GetMapping("/bbs_write")
    public ModelAndView userbbs_write(HttpServletRequest request) {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        ModelAndView wm = new ModelAndView();
        wm.addObject("page", page);
        wm.setViewName("bbs/bbs_write");
        return wm;
    }

    /* 자료실 저장 */
    @PostMapping("/bbs_write_ok")
    public String bbs_write_ok(BbsVO bbs, Bbs2VO bbs2, HttpServletRequest request) {
        String uploadFolder = request.getSession().getServletContext().getRealPath("upload");
        MultipartFile uploadFile = bbs2.getUploadFile();

        if (uploadFile != null && !uploadFile.isEmpty()) {
            String fileName = uploadFile.getOriginalFilename();
            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH) + 1;
            int date = c.get(Calendar.DATE);

            String homedir = uploadFolder + "/" + year + "-" + month + "-" + date;
            File path01 = new File(homedir);

            if (!path01.exists()) {
                path01.mkdir();
            }

            Random r = new Random();
            int random = r.nextInt(100000000);

            int index = fileName.lastIndexOf(".");
            String fileExtension = fileName.substring(index + 1);
            String refileName = "bbs" + year + month + date + random + "." + fileExtension;
            String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

            bbs.setBbs_file(fileDBName);

            File saveFile = new File(homedir + "/", refileName);

            try {
                uploadFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            bbs.setBbs_file("");
        }

        this.centerService.insertBbsWrite(bbs);

        return "redirect:/askcenter";
    }

    /* 자료실 내용보기 + 답변 + 수정 + 삭제 */
    @GetMapping("bbs_cont")
    public ModelAndView bbs_cont(int bbs_no, int page, @RequestParam("state") String state, HttpServletResponse response) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        BbsVO b = this.centerService.getBbsCont(bbs_no);

        if(b == null){
            out.println("<script>");
            out.println("alert('뭐냐?');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
        }
        String bbs_cont = b.getBbs_cont().replace("\n", "<br>");

        ModelAndView mv = new ModelAndView();
        mv.addObject("bbs_cont", bbs_cont);
        mv.addObject("b", b);
        mv.addObject("page", page);

        if(state.equals("cont")){
            mv.setViewName("bbs/bbs_cont");
        }else if(state.equals("reply")){
            mv.setViewName("bbs/bbs_reply");
        }else if(state.equals("edit")){
            mv.setViewName("bbs/bbs_edit");
        }else if(state.equals("del")){
            mv.setViewName("bbs/bbs_del");
        }
        return mv;
    }

    /* 답변 저장 */
    @PostMapping("bbs_reply_ok")
    public ModelAndView bbs_reply_ok(BbsVO b, int page) {
        this.centerService.replyBbs(b);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/askcenter");
        mv.addObject("page", page);

        return mv;
    }

    /* 수정 저장 */
    @PostMapping("bbs_edit_ok")
    public ModelAndView bbs_edit_ok(HttpServletRequest request, HttpServletResponse response, BbsVO b, Bbs2VO b2) throws Exception {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uploadFolder = request.getSession().getServletContext().getRealPath("upload");

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        BbsVO db_bbs = this.centerService.getBbsCont(b.getBbs_no());

        MultipartFile uploadFile = b2.getUploadFile();
        if (uploadFile != null && !uploadFile.isEmpty()) {
            String fileName = uploadFile.getOriginalFilename();
            File delFile = new File(uploadFolder + db_bbs.getBbs_file());

            if(delFile.exists()){
                delFile.delete();
            }

            Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH) + 1;
            int date = c.get(Calendar.DATE);

            String homedir = uploadFolder + "/" + year + "-" + month + "-" + date;
            File path01 = new File(homedir);
            if (!path01.exists()) {
                path01.mkdir();
            }

            Random r = new Random();
            int random = r.nextInt(100000000);

            int index = fileName.lastIndexOf(".");
            String fileExtension = fileName.substring(index + 1);
            String refileName = "bbs" + year + month + date + random + "." + fileExtension;
            String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

            File saveFile = new File(homedir + "/", refileName);

            try{
                uploadFile.transferTo(saveFile);
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            String fileDBName = "";
            if(db_bbs.getBbs_file()!=null){
                b.setBbs_file(db_bbs.getBbs_file());
            }else{
                b.setBbs_file(fileDBName);
            }
        }

        this.centerService.editBbs(b);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/askcenter");
        mv.addObject("page", page);
        mv.addObject("state", "cont");
        mv.addObject("bbs_no", b.getBbs_no());

        return mv;
    }

    /* 삭제 */
    @PostMapping("/bbs_del_ok")
    public String bbs_del_ok(int bbs_no, int page, HttpServletResponse response, HttpServletRequest request) throws Exception {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uploadFolder = request.getSession().getServletContext().getRealPath("upload");

        BbsVO db_bbs = this.centerService.getBbsCont(bbs_no);

        if(db_bbs == null){
            out.println("<script>");
            out.println("alert('뭐냐?');");
            out.println("history.back();");
            out.println("</script>");
            out.close();

            return null;
        }

        this.centerService.delBbs(bbs_no);

        if(db_bbs.getBbs_file()!=null){
            File delFile = new File(uploadFolder + db_bbs.getBbs_file());
            if(delFile.exists()){
                delFile.delete();
            }
        }

        return "redirect:/askcenter?page=" + page;
    }
}
