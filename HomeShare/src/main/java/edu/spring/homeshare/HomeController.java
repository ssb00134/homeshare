package edu.spring.homeshare;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		logger.info("home");
		
		return "index";
	}
	@RequestMapping(value = "/house-insert-sample", method = RequestMethod.GET)
	public void houseInsertTestsample() {
		logger.info("house insert " );
		
		}
	
	
	@RequestMapping(value = "/googlemap", method = RequestMethod.GET)
	public void houseInsertTest() {
		logger.info("house insert " );
		}
	
	@RequestMapping(value = "/juso-popup", method = RequestMethod.GET)
	public void jusopopup() {
		logger.info(" jusopopup " );
		}
	
	@RequestMapping(value = "/juso-popup", method = RequestMethod.POST)
	@ResponseBody
	public String jusopopupPost(HttpServletRequest req, Model model, RedirectAttributes reAttr) {
		String roadFullAddr = req.getParameter("roadFullAddr");
		logger.info(" roadFullAddr " + roadFullAddr );
		String entX = req.getParameter("entX");
		String entY = req.getParameter("entY");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roadFullAddr", roadFullAddr);
		map.put("entX", entX);
		map.put("entY", entY);
		model.addAttribute("jusoMap", map);
		
		return "redirect:/http://localhost:8081/homeshare/juso-test";
		}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void jusotest() {
		logger.info(" index " );
		}
	
	@RequestMapping(value = "/index-2", method = RequestMethod.GET)
	public void jusotest2() {
		logger.info(" index " );
		}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public void about() {
		logger.info(" about " );
		}

	
}
