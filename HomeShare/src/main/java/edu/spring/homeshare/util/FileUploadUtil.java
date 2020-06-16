package edu.spring.homeshare.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.swing.Box.Filler;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class FileUploadUtil {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

	public static String saveUploadedFile(String uploadPath, String NextHouseNo, String fileName, byte[] data) throws IOException {

		

		// ������ ����
		int fileLength = 0;
		fileLength = countFile(uploadPath, NextHouseNo);//
		logger.info(NextHouseNo + "������ ������ ���� ���� : " + fileLength);

		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		String saveName = fileLength + "." + extension;

		String savePath = getUploadPath(uploadPath, NextHouseNo);

		File target = new File(uploadPath + File.separator + savePath, saveName);

		FileCopyUtils.copy(data, target);

		String result = null;
		return "���������Ϸ� �������� : " + fileLength;
	}

	// ������ ������ ���ϴ� �Լ�
	public static int countFile(String uploadPath, String NextHouseNo) {
		File dirPath = new File(uploadPath, NextHouseNo);
		File[] files = dirPath.listFiles();
		return (files == null ? 0 : files.length);
	}

	// ������ ����Ǵ� ���� �̸��� ��¥ ����(/houseno/)���� �����ϱ� ���� ��ƿ
	private static String getUploadPath(String uploadPath, String NextHouseNo) {
		makeDir(uploadPath, NextHouseNo);
		return NextHouseNo;
	}

	private static void makeDir(String uploadPath, String path) {
		File dirPath = new File(uploadPath, path);
		if (!dirPath.exists()) {
			dirPath.mkdir();
			logger.info(dirPath.getPath() + " successfully created.");
		} else {
			logger.info(dirPath.getPath() + " already exists.");
		}
	}

	private static String createThumbnail(String uploadPath, String savePath, String fileName) throws IOException {

		String parent = uploadPath + File.separator + savePath;
		BufferedImage source = ImageIO.read(new File(parent, fileName));
		BufferedImage destination = Scalr.resize(source, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		String thumbnailName = uploadPath + File.separator + savePath + File.separator + "s_" + fileName;
		File thumbnail = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf('.') + 1);

		boolean result = ImageIO.write(destination, formatName, thumbnail);
		logger.info("create thumbnail result: " + result);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	public static void delete(String path) {
		System.out.println("������ ���� ��� : " + path);
		File deleteFolder = new File(path);
		if (deleteFolder.exists()) {
			File[] deleteFolderList = deleteFolder.listFiles();

			for (int i = 0; i < deleteFolderList.length; i++) {
				if (deleteFolderList[i].isFile()) {
					deleteFolderList[i].delete();
				} else {
					delete(deleteFolderList[i].getPath());
				}
				deleteFolderList[i].delete();
			}
			deleteFolder.delete();
		}
	}

	public static void deleteFile(String path, String houseNo, String item) { //��� , item
		System.out.println("������ ���� �̸� : " + item);
		
		File file = new File(path + "\\\\" + houseNo + "\\\\" + item);
        System.out.println("������ ���� ��� : " + path + "\\\\" + houseNo + "\\\\" + item);
        
    	if( file.exists() ){
    		if(file.delete()){
    			System.out.println("���ϻ��� ���� file : " + file.getName());
    			//TODO : rename
    			String folderpath = path + File.separator + houseNo;
    			File dir = new File(folderpath);
    			File []fileList = dir.listFiles();
    			
    		
				for(File folderFile : fileList){
				    if(folderFile.isFile()){
				    	String fileName = folderFile.getName();
				    	System.out.println("������ù���� : " + fileName.charAt(0));
				    	
				    }
				} 

    			
    		}else{
    			System.out.println("���ϻ��� ����");
    			String folderpath = path + File.separator + houseNo;
    			File dir = new File(folderpath);
    			File []fileList = dir.listFiles();

    			for(File folderFile : fileList){
				    if(folderFile.isFile()){
				    	String fileName = folderFile.getName();
				    	System.out.println("������ù���� : " + fileName.charAt(0));
				    }
				} 
    			
    		}
    	}else{
    		System.out.println("������ �������� �ʽ��ϴ�.");
    	}
	}

	public static String readDirectory(String path) {
		System.out.println("�о�� ���� ��� : " + path);
		File dir = new File(path);
		File[] fileList = dir.listFiles();

		String filelist = "";
		for (File file : fileList) {
			if (file.isFile()) {
				String fileName = file.getName();
				filelist += fileName + ",";
			}
		}
		return filelist;
	}

	private static String createIcon(String uploadPath, String savePath, String fileName) {

		String iconName = uploadPath + File.separator + savePath + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');

	}

}