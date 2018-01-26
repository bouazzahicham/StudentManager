package DAO.DAOBeans;




import DAO.DAOException;
import DAO.DAOFactory;
import DAO.DAOUtilitaire;
import WebApp.Beans.Utilisateur;
//import webApp.beans.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOUtilisateurImpl implements DAOUtilisateur
{
    private static final String sql_select_login = "select * from Utilisateur where idUtilisateur = ? and motdePasse = ? ";
    private DAOFactory daoFactory;
    public DAOUtilisateurImpl(DAOFactory daoFactory)
    {
        this.daoFactory = daoFactory;
    }


    @Override
    public Utilisateur charger(Object... objets)
    {
        Utilisateur utilisateur = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        String username = null;
        String password = null;


        try
        {
            connection = daoFactory.getConnection();

            // On throw a null Exception dans la fonction
            preparedStatement = DAOUtilitaire.initialisationRequetePreparee(connection, sql_select_login, true, objets);
            rs = preparedStatement.executeQuery();

            if (rs.next())
                utilisateur = map(rs);
        }

        catch (SQLException e)
        {
            throw new DAOException(e);
        }

        finally
        {
            DAOUtilitaire.fermetureRessources(rs, preparedStatement, connection);

        }


        return utilisateur;


    }
//     Le mapping ------>
//     IMPORTANT: FAIRE ATTENTION AUX NOMS QU ON UTIILISE DANS LA BDD
    private static Utilisateur map(ResultSet resultSet) throws SQLException
    {
        Utilisateur utilisateur = new Utilisateur();

        utilisateur.setId(resultSet.getLong("idUtilisateur"));
        utilisateur.setProfil(resultSet.getString("idProfil"));

//        utilisateur.setLogin(resultSet.getString("login"));
//        utilisateur.setPassword(resultSet.getString("motDepasse"));

        utilisateur.setDescription(resultSet.getString("descriptionUtilisateur"));
        utilisateur.setNom(resultSet.getString("nomProprietaire"));
        utilisateur.setPrenom(resultSet.getString("prenomProprietaire"));

        return utilisateur ;

    }


}
