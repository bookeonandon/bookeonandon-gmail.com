package com.kh.search.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.search.model.dao.SearchDao;
import com.kh.search.model.vo.Search;

public class SearchService {

	
	/**
	 * 1. 검색 키워드 조회
	 * @param keyword	사용자가 입력한 키워드
	 * @return			해당 키워드 존재유무 0or1
	 */
	public int selectCount(String keyword, int memberNo) {
		Connection conn = getConnection();
		
		int result = new SearchDao().selectCount(conn, keyword, memberNo);
		
		if(result == 0) {
			result = insertKeyword(conn, keyword, memberNo);
		}else {
			result = increaseCount(conn, keyword, memberNo);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 2. 검색 카운트가 0일때 insert
	 * @param conn
	 * @param keyword	사용자가 입력한 키워드
	 * @return
	 */
	public int insertKeyword(Connection conn, String keyword, int memberNo) {
		int result = new SearchDao().insertKeyword(conn, keyword, memberNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 3. 검색카운트가 1이상 일때  ++
	 * @param conn
	 * @param keyword
	 * @return
	 */
	public int increaseCount(Connection conn, String keyword, int memberNo) {
		int result = new SearchDao().increaseCount(conn, keyword, memberNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * 3. 도서 검색 리스트 조회 서비스
	 * @param keyword	사용자가 입력한 키워드
	 * @return			해당 키워드 검색내용
	 */
	
	public ArrayList<Search> searchTitle(String keyword) {
		
		Connection conn = getConnection();
		
		ArrayList<Search> list = new SearchDao().searchTitleList(conn, keyword);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 4. 작가 검색 리스트 조회 서비스
	 * @param keyword
	 * @return
	 */
	public ArrayList<Search> searchAuthor(String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Search> list = new SearchDao().searchAuthorList(conn, keyword);
		
		close(conn);
		
		return list;
				
	}

	/**
	 * 5. 인기검색어 top-n
	 * @return	인기검색어 1~10위 리스트
	 */
	public ArrayList<Search> popSearchList(){
		Connection conn = getConnection();
		
		ArrayList<Search> list = new SearchDao().popSearchList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 6. 더보기 정렬기준
	 * @param keyword
	 * @return
	 */
	public ArrayList<Search> sortPop(String keyword){
		Connection conn = getConnection();		
		ArrayList<Search> list = new SearchDao().sortPop(conn, keyword);
		close(conn);
		return list;		
	}
	public ArrayList<Search> sortHighScore(String keyword){
		Connection conn = getConnection();		
		ArrayList<Search> list = new SearchDao().sortHighScore(conn, keyword);
		close(conn);
		return list;		
	}
	public ArrayList<Search> sortIssueDate(String keyword){
		Connection conn = getConnection();		
		ArrayList<Search> list = new SearchDao().sortIssueDate(conn, keyword);
		close(conn);
		return list;		
	}
	
	
	/**
	 * 카테고리 검색
	 * @param keyword
	 * @param category
	 * @return
	 */
	public ArrayList<Search> categorySearch(String keyword, String category){
		Connection conn = getConnection();
		ArrayList<Search> list = new SearchDao().searchCategory(conn, keyword, category);
		close(conn);
		return list;
	}
	
	/**
	 * 서브카테고리
	 * @param keyword
	 * @param category
	 * @return
	 */
	public ArrayList<Search> selectSubCategory(String category, String subCategory){
		Connection conn = getConnection();
		ArrayList<Search> list = new SearchDao().selectSubCategory(conn, category, subCategory);
		close(conn);
		return list;
	}
	
	
}
