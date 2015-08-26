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
import java.sql.Statement;
import resources.CustomSQL;
import resources.Passwords;

/**
 *
 * @author Kadin
 */
public class SystemAcessDAO {

    //Logs
    public Person logIn(String username, String password) throws SQLException {
        Person person = null;
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
                person = new Person(rs);
            }
            
            return person;
            
        } catch (SQLException ex) { 
            throw new RuntimeException(ex);
        }
        
    }

    public void registerCandidate(Person newPerson, String username) throws SQLException {
        Connection connection = JdbcConnection.getConnection();
        
        //Insert a new person into the database 
        PreparedStatement statement_register = CustomSQL.getRegisterPersonStmt(newPerson, connection);

        // since saving and order involves multiple statements across
        // multiple tables we need to control the transaction ourselves
        // to ensure our DB remains consistent
        // turn off auto-commit which effectively starts a new transaction
        connection.setAutoCommit(false);

        //Execute first statement
        if (statement_register.executeUpdate() == 0) {
            throw new SQLException("Creating a new user failed! No rows have been altered");
        }
        
        try (ResultSet autokeys = statement_register.getGeneratedKeys()) {
            if (autokeys.next()) {
                newPerson.setPersonId(autokeys.getInt(1), "candidate");
            } else {
                throw new SQLException("Creating a new user failed!");
            }
        }
        
        //Now we assign the newly created persons id as a candidate_id (FK) in the candidate table
        PreparedStatement statement_assignid = CustomSQL.getAssignCandidateStmt(newPerson.getPersonid(), connection);
        
        //Execute second statement on candidate table
        if (statement_assignid.executeUpdate() == 0) {
            throw new SQLException("Failed to assign person_id as candidate_id in the Candidate table!");
        }

    }
}
