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
		
		//리플 개수
		int replies = replyService.readCount();
		logger.info("총 " + replies +"개의 후기가 있습니다");
		
		//리플 평균값
		double avgScore = replyService.readAvgScore(houseNo);
		logger.info("reply 의 평균 : " + avgScore);

		HouseVO housevo = houseservice.selectByHouseNo(houseNo); // housevo : 리플 houseno에 메핑된 housevo
		
		housevo.setReplies(replies);
		housevo.setScore(avgScore); // housevo 에 score을 넣고 평균 계산
		logger.info("별점 업데이트 전의 housevo : " + housevo.toString());
		
		
		int updateHouseScore = houseservice.update(housevo);

		if (updateHouseScore == 1) {
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
	
	@RequestMapping(value = "/{no}", method = RequestMethod.GET)
	public ResponseEntity<String> readthisReply(
			@PathVariable("houseNo") int houseNo, @RequestBody ReplyVO vo) {
		
		logger.info("get 실행 자신의 리플 보기");
		int result = replyService.update(vo);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}
	
	
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

	@RequestMapping(value = "/{rno}/{houseNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("rno") int rno,
			@PathVariable("houseNo") int houseNo) {
		
		logger.info("reply delete 실행");
		logger.info("rno : " + rno + " houseno : " + houseNo);
		
		int result = replyService.delete(rno);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		
		//리플삭제시 자동으로 별점 업데이트
				List<ReplyVO> replyList = replyService.read(houseNo);
  				int replyCount = replyList.size();
				
				HouseVO housevo = houseservice.selectByHouseNo(houseNo); // housevo : 리플 houseno에 메핑된 housevo
				
				//리플 개수
				int replies = replyService.readCount();
				logger.info("총 " + replies +"개의 후기가 있습니다");
				
				//리플 평균값
				if(replyCount >0) {
					double avgScore = replyService.readAvgScore(houseNo);
					logger.info("reply 의 평균 : " + avgScore);					
					housevo.setScore(avgScore); // housevo 에 score을 넣고 평균 계산
				}
				if(replyCount == 0) {
					logger.info("개수가 없을경우 평균값 0 으로 조정");					
					housevo.setScore(0); // housevo 에 score을 넣고 평균 계산
				}

				
				
				housevo.setReplies(replies);
				
				logger.info("별점 삭제 후 housevo : " + housevo.toString());
				
				
				int updateHouseScore = houseservice.update(housevo);

				if (updateHouseScore == 1) {
					logger.info("별점 등록 성공");
				} else {
					logger.info("별점 등록 실패");
				}
		
		
		return entity;
	}
}
