package edu.spring.homeshare.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.MediaUtil;

//ajax 사용 안함
@Controller
public class FileUploadController {
	private static final Logger logger =
			LoggerFactory.getLogger(FileUploadController.class);
	
	// servlet-context.xml 파일에 설정된 문자열 리소스를 주입(inject)
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private HouseService houseService;
	
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet() {
		
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadPost2(MultipartFile[] files, Model model) throws IOException {
		logger.info("uploadPost() 호출 : 파일 개수 = " + files.length);
		
		String result = "";
		//최대 하우스 번호(시퀀스)값 가져오기
		String NextHouseNo = Integer.toString(houseService.seqence()+1);
		
		
		for (MultipartFile f : files) {
			result =  FileUploadUtil.saveUploadedFile(
					uploadPath, "houseno" + NextHouseNo,
					f.getOriginalFilename(), 
					f.getBytes());
			logger.info("result : " + result);
		}
		
	
		logger.info("result : " + result);

		model.addAttribute("savedFile", result);
		return "upload";
	}
	
	@RequestMapping(value = "/upload-ajax", 
			method = RequestMethod.GET)
	public void uploadAjaxGET() {
		logger.info("uploadAjaxGET() 호출");
	}
	

	
	

	private String saveUploadFile(MultipartFile file) {
		// UUID : 업로드하는 파일 이름이 중복되지 않도록
		UUID uuid = UUID.randomUUID();
		String savedName = uuid + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, savedName); // 저장할 파일 객체 생성
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			logger.info("파일 저장 성공 : " + savedName);
			return savedName;
		} catch (IOException e) {
			logger.error("파일 저장 실패");
			return null;
		}
	}
	
	@RequestMapping(value = "/display/{houseno}/{fileno:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(
			@PathVariable("houseno")  String houseno,
			@PathVariable("fileno")  String fileno)throws IOException {
		logger.info("display() houseno fileno 호출");
		logger.info("houseno : " + houseno);
		logger.info("fileno : " + fileno);
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + houseno + File.separator + fileno;
		
		
		// 파일 확장자
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		if(houseno != null) {
			 logger.info("filePath : " + filePath);
			in = new FileInputStream(filePath); // 경로가 null이 아니면 정상 작업			
		}else {
			logger.info("houseno 없음");
			 filePath = uploadPath + File.separator + "noimage.jpg";
			in = new FileInputStream(filePath); // 		
		}
		
		// 응답 헤더(response header)에 Content-Type 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// 데이터 전송
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
				);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display() throws IOException {
		logger.info("display() noimage 호출");
		
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + "noimage.jpg";
		
		
		// 파일 확장자
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		
			logger.info("houseno 없음");
			 
			in = new FileInputStream(filePath); // 		
		
		
		// 응답 헤더(response header)에 Content-Type 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// 데이터 전송
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
				);
		
		return entity;
	}
	@RequestMapping(value = "/display/{file:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@PathVariable("file") String file) throws IOException {
		logger.info("display() file 호출");
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + file;
		
		
		// 파일 확장자
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
	
			 
			in = new FileInputStream(filePath); // 		
		
		
		// 응답 헤더(response header)에 Content-Type 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// 데이터 전송
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
				);
		
		return entity;
	}

}















