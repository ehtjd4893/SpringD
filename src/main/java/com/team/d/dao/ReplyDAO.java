package com.team.d.dao;

import java.util.List;
import java.util.Map;

import com.team.d.dto.ReplyDTO;

public interface ReplyDAO {

	public void insertReply(Map<String, Object> container);

	public List<ReplyDTO> getReplyListByBidx(long BIDX);

	public List<ReplyDTO> getChildListByRidx(long RIDX);

	public void insertReReply(Map<String, Object> container);
	
}
