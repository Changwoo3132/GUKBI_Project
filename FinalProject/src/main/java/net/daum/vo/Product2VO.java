package net.daum.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class Product2VO {

	private MultipartFile uploadFile;
}
