package net.daum.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Setter
@Getter
public class Bbs2VO {

    private MultipartFile uploadFile;
    //실제 업로드 할 파일정보를 저장,bbs_write.jsp 의 <input type="file" name="uploadFIle">의 네임피라미터 이름과 멤버변수명을 같게한다.
}
