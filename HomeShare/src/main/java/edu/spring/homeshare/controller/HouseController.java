package edu.spring.homeshare.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value="house")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void houseLIst(Model model, Integer page, Integer prePage) {
		logger.info("houselist get 실행");
		
		
		/*페이징 처리*/
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);

		if(page !=null) {
			c.setPage(page);
		}
		if(prePage != null) {
			c.setNumsPerPage(prePage);
		}
		List<HouseVO> list = houseService.read(c);
		logger.info("list 정보 : " + list.toString());
		model.addAttribute("houseList",list);
		
		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(houseService.getToTotalNumsOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		logger.info("전체 하우스 수 : " + maker.getTotalCount());
		logger.info("현재 선택된 페이지 : " + c.getPage());
		logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
		logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
		logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
	}
	
	/* location 검색 실행 */
	

	/*house-detail 메핑*/
	@RequestMapping(value="/house-detail",method = RequestMethod.GET)
	public void readHouse(
			int houseNo,
			Model model,
			@ModelAttribute("criteria") PageCriteria criteria) {
		logger.info("house-detail 실행 " + houseNo);
		logger.info("houseno " + houseNo);
		HouseVO vo = houseService.selectByHouseNo(houseNo);
		logger.info(vo.toString());
		model.addAttribute("houseVO", vo);
	}
	
	/*insert 메핑 */
	
	//숙소등록
	@RequestMapping(value="/house-insert",method = RequestMethod.GET)
	public void houseInsertGet() {
		logger.info("house-insert get 실행");
	}
	@RequestMapping(value="/house-insert-post",method = RequestMethod.POST)
	public String houseInsertPost(HouseVO vo,
			RedirectAttributes reAttr) {
		logger.info("house-insert-post 실행");
		logger.info(vo.toString());
		int result = houseService.create(vo);
		if(result == 1) { // insert 성공
			logger.info("insert 성공");
			reAttr.addFlashAttribute("insert_result", "success");
		}else {
			logger.info("insert 실패");
			reAttr.addFlashAttribute("insert_result", "fail");
		}
		return "redirect:/house/house-list";
	}
}
