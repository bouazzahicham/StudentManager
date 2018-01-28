package DAO.DAOBeans;

import DAO.DAOFactory;
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
        return groupes;
    }






}
