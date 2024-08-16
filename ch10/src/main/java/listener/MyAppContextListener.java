package listener;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class MyAppContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// 애플리케이션 종료 시 JDBC 드라이버 해제
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                System.out.println("JDBC 드라이버가 등록 해제되었습니다: " + driver);
            } catch (Exception e) {
                System.err.println("JDBC 드라이버 해제 중 에러 발생: " + driver + " " + e);
            }
        }
	
	}
	
}
