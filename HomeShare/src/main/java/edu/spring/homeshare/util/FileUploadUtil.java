package edu.spring.homeshare.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class FileUploadUtil {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

	public static String saveUploadedFile(String uploadPath, String memId, int memNoCount, String fileName, byte[] data)
			throws IOException {

		// ������ ����
		int fileLength = 0;
		fileLength = countFile(uploadPath, memId);

		System.out.println(
				"FileUploadUtil.saveuploadfile ���� " + "\n" + "memId ������ ���� ���� : " + countFile(uploadPath, memId));

		String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		String saveName = memId + (fileLength / 2 + 1) + "." + extension;
		String savePath = getUploadPath(uploadPath, (memId + File.separator + memNoCount));
		/**/
		logger.info("uploadPath : " + uploadPath);
		logger.info("saveName :" + saveName);
		logger.info("savePath : " + savePath);
		getPath(uploadPath, memId);

		File target = new File(uploadPath + File.separator + savePath, saveName);
		System.out.println("target : " + target);
		FileCopyUtils.copy(data, target);

		String result = null;
		if (MediaUtil.geMediaType(extension) != null) {
			result = createThumbnail(uploadPath, savePath, saveName);
		} else {
			result = createIcon(uploadPath, savePath, saveName);
		}

		return result;
	}

	// ������ ��θ� ���ϴ� �Լ�
	public static void getPath(String uploadPath, String memId) {
		String savePath = getUploadPath(uploadPath, memId);
		String path = uploadPath + "\\" + savePath;

		File files = new File(path);
		File[] fileList = files.listFiles();

		if (fileList.length > 0) {
			for (int i = 0; i < fileList.length; i++) {
				System.out.println(fileList[i]);
			}
		}
	}

	// �����ȿ� ������ �ִ��� Ȯ���ϴ� �Լ�
	public static boolean isFile(String uploadPath, String memId) {
		String savePath = getUploadPath(uploadPath, memId);
		String path = uploadPath + "\\" + savePath;
		File f = new File(path);
		if (f.exists()) {
			System.out.println("���� ����");
			return true;
		} else {
			System.out.println("���� ����");
			return false;
		}

	}

	// tostring
	public static String getPath2(String uploadPath, String memId, int i) {
		String savePath = getUploadPath(uploadPath, memId);
		String path = uploadPath + "\\" + savePath;

		File files = new File(path);
		File[] fileList = files.listFiles();

		return fileList[i].toString();
	}

	// ������ ����Ǵ� ���� �̸��� ��¥ ����(yyyy/MM/dd)���� �����ϱ� ���� ��ƿ
	private static String getUploadPath(String uploadPath, String path) { // path =memId+File.separator + memNoCount)
		makeDir(uploadPath, path);
		return path;
	}

	private static void makeDir(String uploadPath, String path) { // path = memId+File.separator + memNoCount)
		File dirPath = new File(uploadPath, path);
		if (!dirPath.exists()) {
			dirPath.mkdir();
			logger.info(dirPath.getPath() + " successfully created.");
		} else {
			logger.info(dirPath.getPath() + " already exists.");
		}
	}

	// ���丮�� �����ϴ� �Լ�
	private static void deleteDir(String uploadPath, String path) { // path = memId+File.separator + memNoCount)
		File folder = new File(uploadPath + File.separator + path);
		try {
			while (folder.exists()) {
				File[] folder_list = folder.listFiles(); // ���ϸ���Ʈ ������

				for (int j = 0; j < folder_list.length; j++) {
					folder_list[j].delete(); // ���� ����
					System.out.println("������ �����Ǿ����ϴ�.");
				}
				if (folder_list.length == 0 && folder.isDirectory()) {
					folder.delete(); // ������� ����
					System.out.println("������ �����Ǿ����ϴ�.");
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// ������ ������ ���ϴ� �Լ�
	public static int countFile(String uploadPath, String memId) {
		File dirPath = new File(uploadPath, memId);

		File[] files = dirPath.listFiles();
		return (files == null ? 0 : files.length);
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

	private static String createIcon(String uploadPath, String savePath, String fileName) {

		String iconName = uploadPath + File.separator + savePath + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');

	}

}