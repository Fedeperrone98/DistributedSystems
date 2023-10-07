package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLDao {
  private Connection db = null;

  public MySQLDao(String host, int port, String dbname) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      db = DriverManager.getConnection(
          String.format("jdbc:mysql://%s:%d", host, port),
          System.getenv("DB_ROOT"), System.getenv("DB_PASS"));
      System.out.println("[MySQL] -> Connection Succeded");
    } catch (SQLException sqle) {
      System.out.println("SQLException: " + sqle.getMessage());
      System.out.println("SQLState: " + sqle.getSQLState());
      System.out.println("VendorError: " + sqle.getErrorCode());
    } catch (ClassNotFoundException cnfe) {
      System.out.println("Inner Exception: " + cnfe.getMessage());
      System.out.println("Stack\n:" + cnfe.getStackTrace());
    }
  }

  public Connection getDb() {
    return db;
  }
}