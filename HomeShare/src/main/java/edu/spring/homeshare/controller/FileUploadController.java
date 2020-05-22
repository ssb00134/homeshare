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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.MediaUtil;

//ajax ��� ����
@Controller
public class FileUploadController {
	private static final Logger logger =
			LoggerFactory.getLogger(FileUploadController.class);
	
	// servlet-context.xml ���Ͽ� ������ ���ڿ� ���ҽ��� ����(inject)
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private HouseService houseService;
	
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void uploadGet() {
		
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadPost2(MultipartFile[] files, Model model) throws IOException {
		logger.info("uploadPost() ȣ�� : ���� ���� = " + files.length);
		
		String result = "";
		//�ִ� �Ͽ콺 ��ȣ(������)�� ��������
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
		logger.info("uploadAjaxGET() ȣ��");
	}
	

	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName) throws IOException {
		logger.info("display() ȣ��");
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		String filePath = uploadPath + fileName;
		in = new FileInputStream(filePath);
		
		// ���� Ȯ����
		String extension = 
				filePath.substring(filePath.lastIndexOf(".") + 1);
		
		// ���� ���(response header)�� Content-Type ����
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));
		
		// ������ ����
		entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // ���Ͽ��� ���� ������
					httpHeaders, // ���� ���
					HttpStatus.OK // ���� �ڵ�
				);
		return entity;
	}

	private String saveUploadFile(MultipartFile file) {
		// UUID : ���ε��ϴ� ���� �̸��� �ߺ����� �ʵ���
		UUID uuid = UUID.randomUUID();
		String savedName = uuid + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, savedName); // ������ ���� ��ü ����
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			logger.info("���� ���� ���� : " + savedName);
			return savedName;
		} catch (IOException e) {
			logger.error("���� ���� ����");
			return null;
		}
	}

}















