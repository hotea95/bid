package test;
import java.sql.DriverManager;
public class ConnectDB {
public static void main(String[ ] args) {
//JDBC . 드라이버 클래스 이름을 설정한다
String driver = "oracle.jdbc.driver.OracleDriver";
//JDBC URL . 드라이버 클래스를 사용하여 접속할 을 설정한다
String url = "jdbc:oracle:thin:@localhost:1521:xe";
// 접속할 scott 계정을 할당하여 설정한다.
String userid = "sys";
// 접속할 scott tiger . 계정의 비밀번호를 할당하여 설정한다
String passwd = "1234";
//forName getConnection . 메소드와 메소드에 대한 예외 처리를 한다
try {
// OracleDriver . 클래스를 메모리에 로드하기 위해 클래스 파일을 메모리에 로딩한다
Class.forName(driver);
//오라클 데이터베이스와 연결한다.
DriverManager.getConnection(url, userid, passwd);
//오라클 데이터베이스와 연결에 대한 주소값을 확인한다.
System.out.println(DriverManager.getConnection(url, userid, passwd));
System.out.println("데이터베이스와 연결되었습니다 ." );
} catch(Exception e) {
e.printStackTrace( );
}
}
}
