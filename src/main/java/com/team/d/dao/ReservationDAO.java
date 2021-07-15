package com.team.d.dao;

import java.util.List;

import com.team.d.dto.RoomDTO;

public interface ReservationDAO {
	public List<RoomDTO> remainingRoom(String checkIn, String checkOut, int people);
	public RoomDTO selectRoom(int rNo);
}
