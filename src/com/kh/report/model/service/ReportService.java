package com.kh.report.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.report.model.dao.ReportDao;
import com.kh.report.model.vo.Report;

public class ReportService {
	
	
	public ArrayList<Report> adminSelectListReport(int nno){
		
		Connection conn = getConnection();
		
		
		ArrayList<Report> list = new ReportDao().adminSelectListReport(conn, nno);
		
		close(conn);
		
		
		return list;
		
	}
	
	
	public int deleteListReport(String[] chk) {
		
		Connection conn = getConnection();
		
		int result = new ReportDao().deleteListReport(conn, chk);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	
}
