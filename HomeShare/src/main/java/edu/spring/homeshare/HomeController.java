package edu.spring.homeshare;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/house-insert", method = RequestMethod.GET)
	public void houseInsertTest() {
		logger.info("house insert " );
		}
	
	@RequestMapping(value = "/juso", method = RequestMethod.GET)
	public void juso() {
		logger.info("juso " );
	}
	@RequestMapping(value = "/jusoPopup", method = RequestMethod.GET)
	public void jusoPopup() {
		logger.info("jusopopup " );
	}
	@RequestMapping(value = "/jusoPopup", method = RequestMethod.POST)
	public void jusoPopupPost(
			HttpServletRequest request,
			Model model,
			RedirectAttributes reAttr) {
//		String roadFullAddr = request.getParameter("roadFullAddr");
//		model.addAttribute("roadFullAddr", roadFullAddr);
//		logger .info("jusopopup post½ÇÇà" );
//        logger.info("roadFullAddr : " + roadFullAddr);
//    	return "jusoPopup";
	}
	@RequestMapping(value = "/jusoresult", method = RequestMethod.GET)
	public String jusoresult(HttpServletRequest request,
			ModelAndView model) {
		String roadFullAddr = (String) request.getAttribute("roadFullAddr");
		
		logger.info(roadFullAddr);
		logger.info("jusoresult" );
		return "jusoPopup";
	}
	
}
