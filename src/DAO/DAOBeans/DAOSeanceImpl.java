package DAO.DAOBeans;

import DAO.DAOFactory;
import WebApp.Beans.Groupe;
import WebApp.Beans.Seance;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hicham on 28/01/2018.
 */
public class DAOSeanceImpl
{

    private DAOFactory df;
    PreparedStatement st=null;
    ResultSet resultat=null;
    Connection con=null;

    public DAOSeanceImpl(DAOFactory DF)
    {
        this.df=DF;
    }

    public List<Seance> lister(Integer idutilisateur,Integer idgroupe)
    {
        List<Seance> seances=new ArrayList<Seance>();
        try {
            con=df.getConnection();
            st=con.prepareStatement("select * from view1 where  idUtilisateur=? and idGroupe=?;");
            st.setInt(1,idutilisateur);
            st.setInt(2, idgroupe);
            resultat=st.executeQuery();

            while(resultat.next())
            {
                Seance seance=new Seance();
                seance.setIdSeance(resultat.getInt("idSeance"));
                seance.setDateSeance(resultat.getString("dateSeance"));
                seance.setDureeSeance(resultat.getString("dureeSeance"));
                seance.setNomProprietaire(resultat.getString("nomProprietaire"));
                seance.setApp(resultat.getString("Appel"));
                seance.setCreneauGroupe(resultat.getString("creneauGroupe"));
                seance.setNomGroupe(resultat.getString("nomGroupe"));
                seances.add(seance);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return seances;
    }



}
