package com.kh.library.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.library.model.dao.LibraryDao;

public class LibraryService {

	/**
	 * 라이브러리
	 * @param bookNo
	 * @param memberNo
	 * @return
	 */
	public int searchMyLibrary(int bookNo, int memberNo) {
		Connection conn = getConnection();
		int result = new LibraryDao().searchMyLibrary(conn, bookNo, memberNo);
		close(conn);
		return result;
	}

	/**
	 * 위시리스트
	 * @param bookNo
	 * @param memberNo
	 * @return
	 */
	public int searchWishList(int bookNo, int memberNo) {
		Connection conn = getConnection();
		int result = new LibraryDao().searchMyLibrary(conn, bookNo, memberNo);
		close(conn);
		return result;
	}
}
