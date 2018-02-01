package DAO.DAOBeans;

import DAO.DAOFactory;
import WebApp.Beans.Absence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AbsenceImpl {
	DAOFactory df;
	PreparedStatement st=null;
	ResultSet resultat=null;
	Connection con=null;
	
	public AbsenceImpl(DAOFactory DF)
	{
		this.df=DF;
	}
	
	public List<Absence> lister(Integer ideleve)
	{
		List<Absence> absences=new ArrayList<Absence>();
		try {
			con=df.getConnection();
			st=con.prepareStatement("select * from view4 where  idEleve=? and Absent=1;");
			st.setInt(1,ideleve);
			resultat=st.executeQuery();
			
			while(resultat.next())
				{
					Absence absence=new Absence();
					absence.setJustifie(resultat.getInt("justifie"));
					absence.setDateAbsence(resultat.getString("dateSeance"));
					absences.add(absence);
				}
			}catch (SQLException e) {
			e.printStackTrace();
			}
        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

        return absences;
	}
	public void insererAbsence(ArrayList<Integer> ids,Integer idseance)
	{
		int statut ;
		try {
			con=df.getConnection();
			Iterator mine=ids.iterator();
			while(mine.hasNext())
			{
				st=con.prepareStatement("update gestionseance set Absent=? where  idEleve=? and idSeance=?");
				st.setInt(1, 1);
				st.setInt(2,(int)mine.next());
				st.setInt(3, idseance);
				statut  =st.executeUpdate();
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}
        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

}
