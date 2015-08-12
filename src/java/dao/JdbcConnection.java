package dao;

import java.sql.Connection;
import java.sql.SQLException;

public class JdbcConnection {

   private static final String url = "DATABASE_PATH";
   private static final String username = "";
   private static final String password = "";


   public JdbcConnection() {
	super();
   }

   public static Connection getConnection() {
      //try {
         //return pool.getConnection();
      //} catch (SQLException ex) {
         //throw new RuntimeException(ex);
      //}
      return null; // REMOVE
   }
}
