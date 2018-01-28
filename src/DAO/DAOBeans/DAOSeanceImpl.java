package DAO.DAOBeans;

import DAO.DAOFactory;
import WebApp.Beans.Groupe;
import WebApp.Beans.Seance;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hicham on 28/01/2018.
 */
public class DAOSeanceImpl
{

    private DAOFactory daoFactory;
    Statement st=null;
    ResultSet resultat=null;
    Connection con=null;
    public DAOSeanceImpl(DAOFactory daoFactory)
    {
        this.daoFactory = daoFactory;

    }


    public List<Seance> lister()
    {
        List<Seance> seances=new ArrayList<Seance>();
        try {
            con=daoFactory.getConnection();
            st=con.createStatement();
            resultat=st.executeQuery("select * from seance ;");

            while(resultat.next())
            {
                Seance seance=new Seance();
                seance.setNom_seance(resultat.getString("nom_seance"));
                seances.add(seance);
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return seances;
    }


}
