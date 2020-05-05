package edu.spring.homeshare.persistence;

import edu.spring.homeshare.domain.HouseVO;

public interface HouseDAO {
	HouseVO select(String houseNo);
}
