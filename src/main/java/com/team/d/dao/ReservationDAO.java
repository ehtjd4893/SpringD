package com.team.d.dao;

import java.util.List;

import com.team.d.dto.RoomDTO;

public interface ReservationDAO {
	public List<RoomDTO> remainingRoom(String start,String end,int people);
	public RoomDTO selectRoom(int rNo);
}
