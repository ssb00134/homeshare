package edu.spring.homeshare.service;

import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.BookVO;
@Service
public interface BookService {
	int create(BookVO vo); 
}
