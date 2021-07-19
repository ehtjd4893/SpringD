package com.team.d.dao;

import java.sql.Date;
import java.util.List;

import com.team.d.dto.RoomDTO;

public interface ReservationDAO {
	public List<RoomDTO> remainingRoom(String checkIn, String checkOut, long people);
	public RoomDTO selectRoom(long rNo);
	public int insertReservation(long rNo,long mNo,long people,Date checkIn,Date checkOut,long food,long totalSum,String booker);
	public long selectViewReservation();
}
