
package dao;

/**
 * @author Kadin
 * Represents an Exception specifically related to the DAOController access to
 * the database.
 */
public class DAOException extends RuntimeException {

    public DAOException(String msg, Exception ex) {
        super(msg);
    }

    public DAOException(String msg) {
        super(msg);
    }

}
