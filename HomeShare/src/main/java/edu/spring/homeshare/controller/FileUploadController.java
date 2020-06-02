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
	
	@RequestMapping(value = "/display/{houseno}/{fileno:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(
			@PathVariable("houseno")  String houseno,
			@PathVariable("fileno")  String fileno)throws IOException {
		logger.info("display() houseno fileno ȣ��");
		logger.info("houseno : " + houseno);
		logger.info("fileno : " + fileno);
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + houseno + File.separator + fileno;
		
		
		// ���� Ȯ����
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		if(houseno != null) {
			 logger.info("filePath : " + filePath);
			in = new FileInputStream(filePath); // ��ΰ� null�� �ƴϸ� ���� �۾�			
		}else {
			logger.info("houseno ����");
			 filePath = uploadPath + File.separator + "noimage.jpg";
			in = new FileInputStream(filePath); // 		
		}
		
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
	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display() throws IOException {
		logger.info("display() noimage ȣ��");
		
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + "noimage.jpg";
		
		
		// ���� Ȯ����
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		
			logger.info("houseno ����");
			 
			in = new FileInputStream(filePath); // 		
		
		
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
	@RequestMapping(value = "/display/{file:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@PathVariable("file") String file) throws IOException {
		logger.info("display() file ȣ��");
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + file;
		
		
		// ���� Ȯ����
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
	
			 
			in = new FileInputStream(filePath); // 		
		
		
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

}















