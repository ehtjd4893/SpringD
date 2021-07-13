package com.team.d.dao;

import java.util.List;

import com.team.d.dto.ReservationDTO;

public interface ReservationDAO {

	
	public List<ReservationDTO> remainingRoom(String start,String end,int people);
}
