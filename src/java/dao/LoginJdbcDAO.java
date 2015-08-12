/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
