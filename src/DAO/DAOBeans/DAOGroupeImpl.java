package DAO.DAOBeans;

import DAO.DAOFactory;
import WebApp.Beans.Groupe;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hicham on 28/01/2018.
 */
public class DAOGroupeImpl
{
    private DAOFactory daoFactory;
    Statement st=null;
    ResultSet resultat=null;
    Connection con=null;

    public DAOGroupeImpl(DAOFactory daoFactory)
    {
        this.daoFactory = daoFactory;

    }
    public List<Groupe> lister()
    {
        List<Groupe> groups=new ArrayList<Groupe>();
        try {
            con=daoFactory.getConnection();
            st=con.createStatement();
            resultat=st.executeQuery("select * from groupe;");
            while(resultat.next())
            {
                Groupe group=new Groupe();
                group.setNom_groupe(resultat.getString("nom_groupe"));
                groups.add(group);

            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return groups;
    }


}
