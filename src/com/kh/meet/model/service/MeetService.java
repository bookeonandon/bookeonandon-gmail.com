package com.kh.meet.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.kh.meet.model.vo.PageInfo;
import com.kh.meet.model.vo.RoomCommunity;
import com.kh.meet.model.vo.RoomMemSet;
import com.kh.meet.model.dao.MeetDao;
import com.kh.meet.model.vo.Meet;
import com.kh.meet.model.vo.Meeting;
import com.kh.meet.model.vo.MemMeet;

import static com.kh.common.JDBCTemplate.*;

public class MeetService {

	/**
	 * 1_1. 일반게시판 리스트 총갯수 조회용 서비스
	 * 
	 * @return 게시판 리스트 총 갯수
	 */
	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new MeetDao().getListCount(conn);

		close(conn);

		return listCount;
	}

	/**
	 * 1_2. 일반게시판 리스트 조회용 서비스
	 * 
	 * @param pi currentPage, boardLimit 값이 담겨있는 PageInfo객체
	 * @return 현재페이지에 보여져야할 게시판리스트
	 */
	public ArrayList<Meet> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Meet> list = new MeetDao().selectList(conn, pi);

		close(conn);

		return list;
	}
	
	public ArrayList<Meet> selectSearchList(PageInfo pi, String search) {
		Connection conn = getConnection();

		ArrayList<Meet> list = new MeetDao().selectSearchList(conn, pi, search);

		close(conn);

		return list;
	}

	public Meet MeetSelect(int roomNo) {
		Connection conn = getConnection();

		Meet meet = new MeetDao().MeetSelect(conn, roomNo);

		close(conn);

		return meet;
	}

	public RoomMemSet RoomMemSetSelect(int userNo, int roomNo) {
		Connection conn = getConnection();

		RoomMemSet rms = new MeetDao().RoomMemSetSelect(conn, userNo, roomNo);

		close(conn);

		return rms;
	}

	public RoomMemSet InsertApply(int userNo, int roomNo) {

		Connection conn = getConnection();
		RoomMemSet rms = null;
		int result = new MeetDao().InsertApply(conn, userNo, roomNo);

		if (result > 0) {
			commit(conn);
			rms = RoomMemSetSelect(userNo, roomNo);
		} else {
			rollback(conn);
		}

		close(conn);

		return rms;

	}

	public ArrayList<MemMeet> selectRoomMemList(int roomNo) {
		Connection conn = getConnection();

		ArrayList<MemMeet> list = new MeetDao().selectRoomMemList(conn, roomNo);

		close(conn);

		return list;
	}
	
	public ArrayList<MemMeet> selectRoomMemListN(int roomNo) {
		Connection conn = getConnection();

		ArrayList<MemMeet> list = new MeetDao().selectRoomMemListN(conn, roomNo);

		close(conn);

		return list;
	}
	
	public ArrayList<RoomCommunity> selectRoomChattList(int roomNo) {
		Connection conn = getConnection();

		ArrayList<RoomCommunity> list = new MeetDao().selectRoomChattList(conn, roomNo);

		close(conn);

		return list;
	}
	
	public int insertComment(int userNo, int roomNo, String comment) {
		Connection conn = getConnection();
		
		int result = new MeetDao().insertComment(conn, userNo, roomNo, comment);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteComment(int cmmmtNo) {
		Connection conn = getConnection();
		
		int result = new MeetDao().deleteComment(conn, cmmmtNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deleteMember(int memberNo,int roomNo) {
		Connection conn = getConnection();
		
		int result = new MeetDao().deleteMember(conn, memberNo, roomNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int approveMember(int memberNo,int roomNo) {
		Connection conn = getConnection();
		
		int result = new MeetDao().approveMember(conn, memberNo, roomNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int fixmeetSave(int roomNo,String meetLocation,String meetContents,Timestamp sqlDate) {
		Connection conn = getConnection();
		
		int result = new MeetDao().fixmeetSave(conn, roomNo, meetLocation, meetContents, sqlDate);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int fixmeetUpdate(int roomNo,String meetLocation,String meetContents,Timestamp sqlDate) {
		Connection conn = getConnection();
		
		int result = new MeetDao().fixmeetUpdate(conn, roomNo, meetLocation, meetContents, sqlDate);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Meeting selFixmeet(int roomNo) {
		
		Connection conn = getConnection();
		
		Meeting mt = new MeetDao().selFixmeet(conn, roomNo);

		close(conn);

		return mt;
		
	}
	
	public int uploadMemFile(String changeName, int roomNo,int userNo, String memContent) {
		Connection conn = getConnection();
		
		int result = new MeetDao().uploadMemFile(conn, changeName, roomNo, userNo, memContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int uploadBookFile(String changeName, int roomNo) {
		Connection conn = getConnection();
		
		int result = new MeetDao().uploadBookFile(conn, changeName, roomNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int uploadMemFile(int roomNo,int userNo, String memContent) {
		Connection conn = getConnection();
		
		int result = new MeetDao().uploadMemFile(conn, roomNo, userNo, memContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertRoom(int memberNo,String roomtitle,String roomcontent,String roomtotalpp,String genre) {
		Connection conn = getConnection();
		
		int result = new MeetDao().insertRoom(conn, memberNo, roomtitle, roomcontent, roomtotalpp, genre);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int joinYapplyY(int roomNo, int memberNo) {

		Connection conn = getConnection();
		int result = new MeetDao().joinYapplyY(conn, roomNo, memberNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}
	
	public int selectNewRoomNum(int memberNo) {
		Connection conn = getConnection();
		int roomNo = new MeetDao().selectNewRoomNum(conn, memberNo);
		
		close(conn);

		return roomNo;
	}
	
	public int insertLocation(int roomNo, String location) {
		Connection conn = getConnection();
		int result = new MeetDao().insertLocation(conn, roomNo, location);
		
		close(conn);

		return result;
	}
}









