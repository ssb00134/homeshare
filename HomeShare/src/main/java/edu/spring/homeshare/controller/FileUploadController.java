package edu.spring.homeshare.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.MediaUtil;

@Controller
public class FileUploadController {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	// servlet-context.xml 파일에 설정된 문자열 리소스를 주입(inject)
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/file-upload-test", method = RequestMethod.GET)
	public void fileUploadTest() {
		logger.info("/homeshare/file-upload-test 호출");
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet() {
		logger.info("uploadGet() 호출" + uploadPath);
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void uploadPost(MultipartFile file, Model model) {
		logger.info("uploadPost() 호출");
		logger.info("파일 이름 : " + file.getOriginalFilename());
		logger.info("파일 크기 : " + file.getSize());

		String savedFile = saveUploadFile(file);
		model.addAttribute("savedFile", savedFile);
	}

	@RequestMapping(value = "/upload2", method = RequestMethod.POST)
	public String uploadPost2(MultipartFile[] files, Model model) {
		logger.info("uploadPost2() 호출 : 파일 개수 = " + files.length);

		String result = "";
		for (MultipartFile f : files) {
			result += saveUploadFile(f) + " ";
		}
		model.addAttribute("savedFile", result);
		return "upload";
	}

	@RequestMapping(value = "/upload-ajax", method = RequestMethod.GET)
	public void uploadAjaxGET() {
		logger.info("uploadAjaxGET() 호출");
	}

	@RequestMapping(value = "/upload-ajax", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile[] files, HttpServletRequest req) throws Exception {
		logger.info("uploadAjaxPOST() 호출");

		// 세션 아이디 가져오기
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		logger.info("세션값 : " + memId);

		int filelength = FileUploadUtil.countFile(uploadPath, memId);
		logger.info("파일 갯수 : " + filelength);
		String fail = "not more 3 items";

		if (filelength < 10) { // 파일이 5개 이하일때만 실행
			// 파일 하나만 저장
			String result = null;
			result = FileUploadUtil.saveUploadedFile(uploadPath, memId, files[0].getOriginalFilename(),
					files[0].getBytes());

			for (int i = 0; i < filelength; i++) {
				logger.info("getpath2 : " + FileUploadUtil.getPath2(uploadPath, memId, i));
			}
			logger.info("result.tostring : " + result.toString() );
			 
			return new ResponseEntity<String>(result, HttpStatus.OK);
		} else
			return new ResponseEntity<String>(fail, HttpStatus.OK);
	}
	// end upload ajax

	@RequestMapping(value = "getpath", method = RequestMethod.GET)
	public ResponseEntity<String> getPath(HttpServletRequest req) {

		// 세션 아이디 가져오기
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		logger.info("세션값 : " + memId);

		// 파일길이
		int filelength = FileUploadUtil.countFile(uploadPath, memId);

		String strings = null;
		for (int i = 0; i < filelength; i++) {
			strings += FileUploadUtil.getPath2(uploadPath, memId, i) + ",";
		}

		return new ResponseEntity<String>(strings, HttpStatus.OK);
	}

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName) throws IOException, FileNotFoundException {
		try {
			logger.info("display() 호출");

			ResponseEntity<byte[]> entity = null;
			InputStream in = null;

			String filePath = uploadPath + fileName;
			in = new FileInputStream(filePath);

			// 파일 확장자
			String extension = filePath.substring(filePath.lastIndexOf(".") + 1);

			// 응답 헤더(response header)에 Content-Type 설정
			HttpHeaders httpHeaders = new HttpHeaders();
			httpHeaders.setContentType(MediaUtil.geMediaType(extension));

			// 데이터 전송
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
			);
			logger.info("display entity : " + entity.toString());
			return entity;

		} catch (Exception e) {
			logger.info("filenotFound 발생");
			return null;
		}
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

}
