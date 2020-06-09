package edu.spring.homeshare.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.ReplyVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.ReplyService;

@RestController
@RequestMapping(value = "/replies")
public class ReplyRestContrller {
	private static final Logger logger = LoggerFactory.getLogger(ReplyRestContrller.class);

	@Autowired
	private ReplyService replyService;

	@Autowired
	private HouseService houseservice;

	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> creatReply(@RequestBody ReplyVO vo) {
		logger.info("create 실행 ");
		logger.info(vo.toString());
		int result = replyService.create(vo);

		//리플작성시 자동으로 별점 업데이트
		int houseNo = vo.getHouseNo(); // 등록할 하우스 번호

		//리플 평균값
		double avgScore = replyService.readAvgScore(houseNo);
		logger.info("평균 : " + avgScore);

		HouseVO housevo = houseservice.selectByHouseNo(houseNo); // housevo : 리플 houseno에 메핑된 housevo
		housevo.setScore(avgScore); // housevo 에 score을 넣고 평균 계산

		int updateScore = houseservice.update(housevo);

		if (updateScore == 1) {
			logger.info("별점 등록 성공");
		} else {
			logger.info("별점 등록 실패");
		}

		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

	@RequestMapping(value = "/all/{no}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> readReplies(@PathVariable("no") int houseNo) {
		logger.info("reply read 실행 ");
		List<ReplyVO> list = replyService.read(houseNo);
		logger.info("list : " + list.toString());

		return new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
	};

	@RequestMapping(value = "/{no}", method = RequestMethod.PUT)
	public ResponseEntity<String> updateReply(@PathVariable("no") int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);
		logger.info("put 실행");
		int result = replyService.update(vo);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("rno") int rno, ReplyVO vo) {
		int result = replyService.delete(rno);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		
		//리플작성시 자동으로 별점 업데이트
		int houseNo = vo.getHouseNo(); // 등록할 하우스 번호

		//리플 평균값
		int avgScore = replyService.readAvgScore(houseNo);
		logger.info("평균 : " + avgScore);
		
		int replyCount = replyService.readCount();
		logger.info("리플 개수  : " + replyCount);
		//삭제할 값
		int thisScore = (vo.getCleanScore() + vo.getCheckinScore())/2 ;
		
		int deleteScore = (avgScore -thisScore) /  (replyCount - 1);

		HouseVO housevo = houseservice.selectByHouseNo(houseNo); // housevo : 리플 houseno에 메핑된 housevo
		housevo.setScore(deleteScore); // housevo 에 score을 넣고 평균 계산

		int updateScore = houseservice.update(housevo);

		if (updateScore == 1) {
			logger.info("별점 등록 성공");
		} else {
			logger.info("별점 등록 실패");
		}

		return entity;
	}
}
