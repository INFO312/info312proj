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
import resources.CustomSQL;
import resources.Passwords;

/**
 *
 * @author Kadin
 */
public class SystemAccessDAO {

    /**
     * Logs a user in if credentials are valid
     * CURRENTLY processes password in this method, although could be moved to Servlet,
     * but this would require two different DAO methods? 
     * 
     * @param email Email for user to login
     * @param password Users Password
     * @return Person object representation of logged in user
     * @throws SQLException 
     */
    public Person logInCandidate(String email, String password) throws SQLException {
        Person person = null;
        Connection connection = JdbcConnection.getConnection();
        connection.setAutoCommit(false);

        PreparedStatement authorizeStatement = CustomSQL.getAuthorizeCandidateStmt(email, connection);
        // execute the statement
        ResultSet rs_authorize = authorizeStatement.executeQuery();
        
        //If we managed to get the salt and hash for this user
        if (rs_authorize.next()) {
            
            //Convert to bytes, MAY NEED TO BE UTF-8?
            byte[] salt = rs_authorize.getString("salt").getBytes();
            byte[] expectedHash = rs_authorize.getString("hash").getBytes();
            
            //If the password they entered is correct (re hash the password with the salt stored
            //in the db, and if the new hash == the expected hash, then credentials are valid
            //NOTE: .toCharArray() is neccessary for isExpectedPassword to function
            if (Passwords.isExpectedPassword(password.toCharArray(), salt, expectedHash)) {
                PreparedStatement retrieveUserStatement = CustomSQL.getRetrieveUserStmt(email, connection);
                ResultSet rs_person = retrieveUserStatement.executeQuery();
                //Parse a Person object from the result set
                if (rs_person.next()) {
                    person = new Person(rs_person);
                }
            }
        }

        return person;
    }

    /**
     * 
     * 
     * @param newPerson The newly created Person object passed from the RegisterServlet
     * @param email Users Email
     * @param salt
     * @param hash
     * @throws SQLException 
     */
    public void registerCandidate(Person newPerson, String salt, String hash) throws SQLException {
        Connection connection = JdbcConnection.getConnection();

        //Insert a new person into the database stmt 
        PreparedStatement statement_register = CustomSQL.getRegisterPersonStmt(newPerson, newPerson.getEmail(), salt, hash, connection);

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
        PreparedStatement assignIdStatement = CustomSQL.getAssignCandidateStmt(newPerson.getPersonid(), connection);

        //Execute second statement on candidate table
        if (assignIdStatement.executeUpdate() == 0) {
            throw new SQLException("Failed to assign person_id as candidate_id in the Candidate table!");
        }

    }
}
