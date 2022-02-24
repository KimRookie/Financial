package choose_number;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FinancialDB {

	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	//맨뒤에 ORA92는 오라클 DB의 SID
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	//id와 pw
	public static final String USER = "hr";
	public static final String PASS = "hr";
	
	public static final String boardList = "select * from board";
	public static final String board = "select * from board where name=?";
	public static final String writer = "select subject from board where name=?";
	
	public static final String insertBoard = "insert into board values(?, ?, ?)";
	public static final String updateBoard = "update board set name=?, addr=?"
		+ " where id=?";
	
	public static final String deleteBoard = "delete from board where name=?";
	
	public static final String searchBoard = "select * from board where name like ?";
	public static void main(String[] a)
	{
		FinancialDB  dd = new FinancialDB();
		try {
			ArrayList<String[]> list = dd.getAllStudent();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public FinancialDB() { //생성될때 드라이버 로딩
		init();
	} //Construct
	
	private void init() { //드라이버 로딩 메서트
		try {
			Class.forName(DRIVER);
			System.out.println("1/6 드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("1/6 드라이버 로딩 실패");
		}
	} //init
	
	public Connection getConnection() { //DB연결
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			System.out.println("2/6 연결 성공");
		} catch (SQLException e) {
			System.out.println("2/6 연결 실패");
		}
		return conn;
	} //getConnection
	
	public void close(Connection conn, Statement stmt, ResultSet rs) {
		if(rs!=null) { //메서드에 따라 없는 경우도 있으므로 null이 아닐때만 닫아준다.
			try {
				rs.close(); //닫을땐 최근에 연것부터 닫는다.
			} catch (SQLException e) {
			}
		}
		
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
			}
		}
		
		if(conn!=null) {
			try {
				conn.close();
				System.out.println("6/6 닫기 성공");
			} catch (SQLException e) {
				System.out.println("6/6 닫기 실패");
			}
		}
	}
	public ArrayList<String[]> getAllStudent() throws SQLException {
		ArrayList<String[]> v = new ArrayList(); //받아온 데이터를 저장할 벡터
		
		Connection conn = null; //연결부
		PreparedStatement psmt = null; //쿼리부, ?에 값을 주기 위해 PrepareStatement사용
		ResultSet rs = null; //리시버
		
		try {
			// 2/6
			conn = this.getConnection(); //이 클래스에 getConnection이 없으므로 부모에서 호출 
			System.out.println("2/6 성공 -- getAllStudent");
			
			// 3/6
			psmt = conn.prepareStatement(boardList);
			System.out.println("3/6 성공 -- boardList");
			
			// 4/6
			rs = psmt.executeQuery(); //쿼리실행해서 rs에 값을 받아온다. 
			System.out.println("4/6 성공 -- boardList");
			
			//5/6 
			while(rs.next()) { //받아온 값에서 다음값이 없을때까지 실행
				int i=1; //컬럼을 넘기기 위한 변수
				String id = rs.getString(i++); //rs의 값을 받아 저장
				String name = rs.getString(i++);
				String addr = rs.getString(i++);
				v.add(new String[]{id, name, addr}); //저장한 값을 벡터에 저장한다.
			}
			System.out.println("5/6 성공 -- getAllStudent");
			
		} catch (SQLException e) {	
			System.out.println("실패 -- getAllStudent" + e);
			//throw new SQLException("getAllStudent 실패 " + e);
		} finally { //close가 반드시 실행되도록
			this.close(conn, psmt, rs); //부모의 close호출
		}
		return v;
	} //getAllStudent
	
	public ArrayList<String[]> getAllStudentByName(String names) throws SQLException {
		ArrayList<String[]> v = new ArrayList();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.getConnection(); // 2/6
			System.out.println("2/6 성공 -- getAllStudentByName");
			
			psmt = conn.prepareStatement(searchBoard); // 3/6
			psmt.setString(1,"%" + names + "%"); //첫번째 ?에 두번째 아규먼트로 대체한다.
			System.out.println("3/6 성공 -- searchBoard");
			
			rs = psmt.executeQuery(); // 4/6
			System.out.println("4/6 성공 -- searchBoard");
			
			while(rs.next()) { // 5/6
				int i=1;
				String id = rs.getString(i++);
				String name = rs.getString(i++);
				String addr = rs.getString(i++);
				v.add(new String[]{id, name, addr});
			}
			System.out.println("5/6 성공 -- getAllStudentByName");
			
		} catch (SQLException e) {	
			System.out.println("실패 -- getAllStudentByName" + e);
			throw new SQLException("getAllStudentByName 실패 " + e);
		} finally {
			this.close(conn, psmt, rs);
		}
		return v;
	} //getAllStudentByName
	
	public String[] getStudent(String ids) throws SQLException {//1로우이므로 DTO로 반환
		String[] dto = new String[3];
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.getConnection(); // 2/6
			System.out.println("2/6 성공 -- getStudent");
			
			psmt = conn.prepareStatement(board); // 3/6
			psmt.setString(1, ids.trim());
			System.out.println("3/6 성공 -- board");
			
			rs = psmt.executeQuery(); // 4/6
			System.out.println("4/6 성공 -- board");
			
			while(rs.next()) { // 5/6
				int i=1;
				String id = rs.getString(i++);
				String name = rs.getString(i++);
				String addr = rs.getString(i++);
				dto[0]=id.trim(); //dto에 저장해서 통째 반납한다.
				dto[1]=name.trim();
				dto[2]=addr.trim();
			}
			System.out.println("5/6 성공 -- board");
			
		} catch (SQLException e) {	
			System.out.println("실패 -- board" + e);
			throw new SQLException("board 실패 " + e);
		} finally {
			this.close(conn, psmt, rs);
		}
		return dto;
	} //getStudent
	
	//insert, delete, update에서 현재 있는 id인지를 확인하기 위한 메서드
//	public boolean hasId(String id) { 
//		boolean hasl = false; //리턴값을 주기위한 변수
//		
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = this.getConnection();// 2/6
//			
//			psmt = conn.prepareStatement(HASSTUDENT); //3/6
//			psmt.setString(1, id.trim() );
//			
//			rs = psmt.executeQuery(); // 4/6
//			
//			// 5/6
//			if(rs.next()) {
//				hasl = true;
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("hasId 실패");
//		} finally {
//			close(conn, psmt, rs);
//		}
//		return hasl;
//	}
//	
//	public boolean insertStudent(String id, String name, String addr) throws IdDuplicatedException, SQLException {
//		
//		if(this.hasId(id.trim())) { 
//			throw new IdDuplicatedException(id + "가 이미 존재합니다."); //사용자 정의 익셉션
//		}
//		
//		boolean ins = false;
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		
//		int count = 0; //쿼리실행이 잘 되었나를 확인하기 위한 변수
//		
//		try {
//			conn = this.getConnection();// 2/6
//			
//			psmt = conn.prepareStatement(StudentsUtil.INSERTSTUDENT); // 3/6
//			psmt.setString(1, id.trim());
//			psmt.setString(2, name.trim());
//			psmt.setString(3, addr.trim());
//			
//			count = psmt.executeUpdate();
//			if (count>0) { //쿼리가 잘 실행되었으면
//				ins = true; //반환값을 true로...
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("실패했습니다. -- insertStudent" + e);
//			throw new SQLException();
//		} finally {
//			close(conn, psmt, null);
//		}
//		
//		return ins;
//	}
//	
//	public boolean updateStudent(String id, String name, String addr) throws IdNotFoundException, SQLException {
//		
//		if(!this.hasId(id.trim())) {
//			throw new IdNotFoundException(id + "가 없습니다.");
//		}
//		
//		boolean ins = false;
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		
//		int count = 0;
//		
//		try {
//			conn = this.getConnection();// 2/6
//			
//			psmt = conn.prepareStatement(StudentsUtil.UPDATESTUDENT); // 3/6
//			psmt.setString(1, name.trim());
//			psmt.setString(2, addr.trim());
//			psmt.setString(3, id.trim());
//			
//			count = psmt.executeUpdate();
//			if (count>0) {
//				ins = true;
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("실패했습니다. -- updateStudent" + e);
//			throw new SQLException();
//		} finally {
//			close(conn, psmt, null);
//		}
//		
//		return ins;
//	}
//	
//	public boolean deleteStudent(String id) throws IdNotFoundException, SQLException {
//		
//		if(!this.hasId(id.trim())) {
//			throw new IdNotFoundException(id + "가 없습니다.");
//		}
//		
//		boolean ins = false;
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		
//		int count = 0;
//		
//		try {
//			conn = this.getConnection();// 2/6
//			
//			psmt = conn.prepareStatement(StudentsUtil.DELETESTUDENT); // 3/6
//			psmt.setString(1, id.trim());
//			
//			count = psmt.executeUpdate();
//			if (count>0) {
//				ins = true;
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("실패했습니다. -- deleteStudent" + e);
//			throw new SQLException();
//		} finally {
//			close(conn, psmt, null);
//		}
//		
//		return ins;
//	}

}
