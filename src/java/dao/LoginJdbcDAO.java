/*
 * Post Grad Management System Project Files
 * 2015
 * Authors: Kadin Boyle, Corey Sutton, Samuel O Connell, Hunter Stewart, Nathan Blomfield
 */
package dao;

import domain.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kadin
 */
public class LoginJdbcDAO {

    //@Override
    public Person logIn(String username, String password) {
        try (
                Connection connection = JdbcConnection.getConnection();
                //Create the SQL statement
                PreparedStatement stmt = connection.prepareStatement(
                        "select * from PERSON where USERNAME = ? and PASSWORD = ?");) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            // execute the statement
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String usern = rs.getString("username");
                //....
                //...
                Person person = new Person();//Insert constructor params
                return person;
            } else {
                return null;
            }

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

    }
}
