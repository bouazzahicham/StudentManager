package DAO.DAOBeans;

import DAO.DAOException;
import DAO.DAOFactory;
import DAO.DAOUtilitaire;
import WebApp.Beans.Groupe;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hicham on 28/01/2018.
 */
public class DAOGroupeImpl
{
    DAOFactory df;
    PreparedStatement st=null;
    ResultSet resultat=null;
    Connection con=null;

    String sql_add_groupe = "insert into groupe values(null,?,?,null,null) ;";
    public DAOGroupeImpl(DAOFactory DF)

    {
        this.df=DF;
    }

    public List<Groupe> lister_user(Integer idutilisateur)
    {

        List<Groupe> groupes=new ArrayList<Groupe>();
        try {
            con=df.getConnection();
            st=con.prepareStatement("select * from view2 where idUtilisateur=?;");
            st.setInt(1,idutilisateur);
            resultat=st.executeQuery();
            while(resultat.next())
            {
                Groupe groupe=new Groupe();
                groupe.setIdGroupe(resultat.getInt("idGroupe"));
                groupe.setNomGroupe(resultat.getString("nomGroupe"));
                groupe.setDescriptionGroupe(resultat.getString("descriptionGroupe"));
                groupes.add(groupe);
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return groupes;
    }

    public List<Groupe> lister()
    {
        List<Groupe> groupes=new ArrayList<Groupe>();
        try {
            con=df.getConnection();
            st=con.prepareStatement("select * from groupe");
            resultat=st.executeQuery();
            while(resultat.next())
            {
                Groupe groupe=new Groupe();
                groupe.setIdGroupe(resultat.getInt("idGroupe"));
                groupe.setNomGroupe(resultat.getString("nomGroupe"));
                groupes.add(groupe);
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        return groupes;
    }
    public int ajouter(Object... objets)
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try
        {
            connection = df.getConnection();

            System.out.println(connection);
            // On throw a null Exception dans la fonction
            preparedStatement = DAOUtilitaire.initialisationRequetePreparee(connection, sql_add_groupe , true,objets);
            int statut = preparedStatement.executeUpdate();
            if (statut == 0)
                throw new DAOException("Échec de la création du groupe s, aucune ligne ajoutée dans la table.");

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
