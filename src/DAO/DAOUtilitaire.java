package DAO;
// Elle gere la fermeture des ressources en entier pour pas de linkage

import java.sql.*;

final public class DAOUtilitaire
{
    public static void fermetureRessources(ResultSet resultSet )
    {
        if ( resultSet != null ) {
            try {
                resultSet.close();
            } catch ( SQLException e ) {
                System.out.println( "Échec de la fermeture du ResultSet : " + e.getMessage() );
            }
        }
    }

    public static void fermetureRessources(Statement statement )
    {
        if ( statement != null ) {
            try {
                statement.close();
            } catch ( SQLException e ) {
                System.out.println( "Échec de la fermeture du Statement : " + e.getMessage() );
            }
        }
    }

    public static void fermetureRessources(Connection connexion )
    {
        if ( connexion != null ) {
            try {
                connexion.close();
            } catch ( SQLException e ) {
                System.out.println( "Échec de la fermeture de la connexion : " + e.getMessage() );
            }
        }
    }

    public static void fermetureRessources( Statement statement, Connection connexion )
    {
        fermetureRessources( statement );
        fermetureRessources( connexion );
    }

    public static void fermetureRessources( ResultSet resultSet, Statement statement, Connection connexion )
    {
        fermetureRessources( resultSet );
        fermetureRessources( statement );
        fermetureRessources( connexion );
    }

    public static PreparedStatement initialisationRequetePreparee(Connection connexion, String sql, boolean returnGeneratedKeys, Object... objets ) throws SQLException
    {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql, returnGeneratedKeys ? Statement.RETURN_GENERATED_KEYS : Statement.NO_GENERATED_KEYS );

        for ( int i = 0; i < objets.length; i++ )
        {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }
}
