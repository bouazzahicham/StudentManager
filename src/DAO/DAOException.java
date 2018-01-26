package DAO;

/**
 * Created by Hicham on 04/09/2017.
 */
public class DAOException extends RuntimeException
{
    public DAOException(String message)
    {
        super(message);
    }

    public DAOException(String message, Throwable cause)
    {
        super(message, cause);
    }

    public DAOException(Throwable cause)
    {
        super(cause);
    }

}