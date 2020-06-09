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
		logger.info("create ���� ");
		logger.info(vo.toString());
		int result = replyService.create(vo);

		//�����ۼ��� �ڵ����� ���� ������Ʈ
		int houseNo = vo.getHouseNo(); // ����� �Ͽ콺 ��ȣ

		//���� ��հ�
		double avgScore = replyService.readAvgScore(houseNo);
		logger.info("��� : " + avgScore);

		HouseVO housevo = houseservice.selectByHouseNo(houseNo); // housevo : ���� houseno�� ���ε� housevo
		housevo.setScore(avgScore); // housevo �� score�� �ְ� ��� ���

		int updateScore = houseservice.update(housevo);

		if (updateScore == 1) {
			logger.info("���� ��� ����");
		} else {
			logger.info("���� ��� ����");
		}

		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}

	@RequestMapping(value = "/all/{no}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> readReplies(@PathVariable("no") int houseNo) {
		logger.info("reply read ���� ");
		List<ReplyVO> list = replyService.read(houseNo);
		logger.info("list : " + list.toString());

		return new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
	};

	@RequestMapping(value = "/{no}", method = RequestMethod.PUT)
	public ResponseEntity<String> updateReply(@PathVariable("no") int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);
		logger.info("put ����");
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
		
		
		//�����ۼ��� �ڵ����� ���� ������Ʈ
		int houseNo = vo.getHouseNo(); // ����� �Ͽ콺 ��ȣ

		//���� ��հ�
		int avgScore = replyService.readAvgScore(houseNo);
		logger.info("��� : " + avgScore);
		
		int replyCount = replyService.readCount();
		logger.info("���� ����  : " + replyCount);
		//������ ��
		int thisScore = (vo.getCleanScore() + vo.getCheckinScore())/2 ;
		
		int deleteScore = (avgScore -thisScore) /  (replyCount - 1);

		HouseVO housevo = houseservice.selectByHouseNo(houseNo); // housevo : ���� houseno�� ���ε� housevo
		housevo.setScore(deleteScore); // housevo �� score�� �ְ� ��� ���

		int updateScore = houseservice.update(housevo);

		if (updateScore == 1) {
			logger.info("���� ��� ����");
		} else {
			logger.info("���� ��� ����");
		}

		return entity;
	}
}
