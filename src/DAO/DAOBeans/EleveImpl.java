package DAO.DAOBeans;


import DAO.DAOFactory;
import WebApp.Beans.Eleve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EleveImpl
{
	
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
			st=con.prepareStatement("select * from eleve where idGroupe=?;");
			st.setInt(1,idgroupe);
			resultat=st.executeQuery();
			while(resultat.next())
				{
					Eleve eleve=new Eleve();
					eleve.setNomEleve(resultat.getString("nomEleve"));
					eleve.setPrenomEleve(resultat.getString("prenomEleve"));
					eleve.setIdEleve(resultat.getInt("idEleve"));
					eleves.add(eleve);
				}
			}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} 
		return eleves;
	}
	

	
	

}
