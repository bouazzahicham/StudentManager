package DAO.DAOBeans;


import DAO.DAOException;
import DAO.DAOFactory;
import DAO.DAOUtilitaire;
import WebApp.Beans.Eleve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class EleveImpl
{
    private static final String sql_add_student = "insert into eleve values(null,?,?,?,?,?,?,?) ";

    DAOFactory df;
    PreparedStatement st=null;
    ResultSet resultat=null;
    Connection con=null;
    List<Eleve> eleves;

    public EleveImpl(DAOFactory DF)
    {
        this.df=DF;
    }
    public List<Eleve> lister(Integer idgroupe)
    {
        eleves=new ArrayList<Eleve>();

        try {
            con=df.getConnection();
            if(idgroupe < 0  )
                st = con.prepareStatement("select * from eleve  ");
            else
            {
                st = con.prepareStatement("select * from eleve where idGroupe=?");
                st.setInt(1, idgroupe);
            }


            resultat=st.executeQuery();
            while(resultat.next())
            {
                Eleve eleve= new Eleve();
                eleve.setNomEleve(resultat.getString("nomEleve"));
                eleve.setPrenomEleve(resultat.getString("prenomEleve"));
                eleve.setIdEleve(resultat.getInt("idEleve"));
                eleve.setIdGroupe(resultat.getInt("idGroupe"));
                eleve.setTelephoneEleve(resultat.getString("telephoneEleve"));
                eleves.add(eleve);
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
        return eleves;
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
            preparedStatement = DAOUtilitaire.initialisationRequetePreparee(connection, sql_add_student , true,objets);
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
