package DAO.DAOBeans;

import DAO.DAOException;
import DAO.DAOFactory;
import DAO.DAOUtilitaire;
import WebApp.Beans.Utilisateur;
//import WebApp.beans.Utilisateur;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAOUtilisateurImpl
{
    PreparedStatement st=null;
    ResultSet resultat=null;
    Connection con=null;
    private ArrayList<Utilisateur> utilisateurs ;
    private static final String sql_select_login = "select * from Utilisateur where idUtilisateur = ? and motdePasse = ? ";
    private static final String sql_select_login_all = "select * from Utilisateur ";
    private static final String sql_add_utilisateur = "insert into utilisateurs(nomProprietaire,prenomProprietaire,idProfil,motdePasse,idUtilisateur,descriptionUtilisateur) values(?,?,?,?,?,?)";


    private DAOFactory daoFactory;
    public DAOUtilisateurImpl(DAOFactory daoFactory)
    {
        this.daoFactory = daoFactory;
    }

    public List<Utilisateur> lister(Integer idUtilisateur)
    {
         utilisateurs =new ArrayList<Utilisateur>();

        try {
            con=daoFactory.getConnection();
            if(idUtilisateur < 0  )
                st = con.prepareStatement("select * from Utilisateur  ");
            else
            {
                st = con.prepareStatement("select * from eleve where idUtilisateur=?");
                st.setInt(1, idUtilisateur);
            }


            resultat=st.executeQuery();
            while(resultat.next())
            {
                Utilisateur utilisateur= new Utilisateur();
                utilisateur.setNomProprietaire(resultat.getString("nomProprietaire"));
                utilisateur.setPrenomProprietaire(resultat.getString("prenomProprietaire"));
                utilisateur.setMotdePasse(resultat.getString("motdePasse"));
                utilisateur.setIdUtilisateur(resultat.getString("idUtilisateur"));
                utilisateur.setDescriptionUtilisateur(resultat.getString("descriptionUtilisateur"));
                utilisateur.setIdProfil(resultat.getString("idProfil"));
                utilisateurs.add(utilisateur);
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        for(Utilisateur e : utilisateurs)
            System.out.println(e.getIdProfil());
        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return utilisateurs;
    }

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

        utilisateur.setIdUtilisateur(resultSet.getString("idUtilisateur"));
        utilisateur.setIdProfil(resultSet.getString("idProfil"));

//        utilisateur.setLogin(resultSet.getString("login"));
//        utilisateur.setPassword(resultSet.getString("motDepasse"));

        utilisateur.setDescriptionUtilisateur(resultSet.getString("descriptionUtilisateur"));
        utilisateur.setNomProprietaire(resultSet.getString("nomProprietaire"));
        utilisateur.setPrenomProprietaire(resultSet.getString("prenomProprietaire"));

        return utilisateur ;

    }



    public List<Utilisateur> lister()
    {
        Statement st=null;
        ResultSet resultat=null;
        Connection con=null;

        List<Utilisateur> users=new ArrayList<Utilisateur>();
        try {
            con=daoFactory.getConnection();
            st=con.createStatement();
            resultat=st.executeQuery("select * from profil;");
            while(resultat.next())
            {
                Utilisateur user=new Utilisateur();
                user.setNomProprietaire(resultat.getString("nomProprietaire"));
                user.setIdUtilisateur(resultat.getString("idUtilisateur"));
                user.setPrenomProprietaire(resultat.getString("prenomProprietaire"));
                users.add(user);
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return users;
    }


    public int ajouter(Object... objets)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try
        {
            connection = daoFactory.getConnection();
            preparedStatement = DAOUtilitaire.initialisationRequetePreparee(connection, sql_add_utilisateur , true,objets);

            int statut = preparedStatement.executeUpdate();
            if (statut == 0)
                throw new DAOException("Échec de la création de l'utilisateur, aucune ligne ajoutée dans la table.");


            rs = preparedStatement.getGeneratedKeys();
//            String idEleve = rs.getString("idEleve");
//            String idGroupe = rs.getString("idGroupe");
//
//            preparedStatement = DAOUtilitaire.initialisationRequetePreparee(connection,"insert into gestionSeance values(?,?)'",true,idEleve,idGroupe);
//            statut = preparedStatement.executeUpdate();
//            if(statut == 0 )
//                throw new DAOException("Echec de l'ajout dans gestion seances. ");

        }

        catch (SQLException e)
        {
            System.out.println(e.getStackTrace());
            throw new DAOException(e);
        }

        finally
        {
            DAOUtilitaire.fermetureRessources(rs, preparedStatement, connection);

        }


        return 0 ;
    }



}
