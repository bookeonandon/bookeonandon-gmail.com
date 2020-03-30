package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.faq.model.dao.FaqDao;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
	
	
	/**
	 * 1. 리뷰 관리자 조회
	 * @return			조회된 리뷰 객체 리스트
	 */
	public ArrayList<Review> adminSelectListReview(){
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().adminSelectListReview(conn);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 2. 리뷰 관리자 삭제
	 * @param chk		클릭되어 넘어온 리뷰 번호 배열
	 * @return			처리된 행의 개수
	 */
	public int adminDeleteReview(String[] chk) {
		
		Connection conn = getConnection();	
		
		int result = new ReviewDao().adminDeleteReview(conn, chk);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
