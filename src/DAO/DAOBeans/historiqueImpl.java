package DAO.DAOBeans;


import DAO.DAOFactory;
import WebApp.Beans.Historique;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class historiqueImpl {
	DAOFactory df;
	PreparedStatement st=null;
	ResultSet resultat=null;
	Connection con=null;
	
	public historiqueImpl(DAOFactory DF)
	{
		this.df=DF;
	}
	
	public List<Historique> lister_groupe(Integer idgroupe)
	{
		List<Historique> historiques=new ArrayList<Historique>();
		try {
			con=df.getConnection();
			st=con.prepareStatement("select * from view3 where  idGroupe=? ;");
			st.setInt(1,idgroupe);
			resultat=st.executeQuery();
			while(resultat.next())
				{
					Historique historique=new Historique();
					historique.setDescriptionEvent(resultat.getString("descriptionEvent"));
					historique.setDateEvent(resultat.getString("dateEvent"));
					historique.setDureeEvent(resultat.getString("dureeEvent"));
					historique.setNomEleve(resultat.getString("nomEleve"));
					historique.setNomEleve(resultat.getString("prenomEleve"));
					historiques.add(historique);
				}
			}catch (SQLException e) {
			e.printStackTrace();
			} 
		 
		return historiques;
	}
	
	public List<Historique> lister_eleve(Integer ideleve)
	{
		List<Historique> historiques=new ArrayList<Historique>();
		try {
			con=df.getConnection();
			st=con.prepareStatement("select * from view3 where  idEleve=? ;");
			st.setInt(1,ideleve);
			resultat=st.executeQuery();
			while(resultat.next())
				{
					Historique historique=new Historique();
					historique.setDescriptionEvent(resultat.getString("descriptionEvent"));
					historique.setDateEvent(resultat.getString("dateEvent"));
					historique.setNomEleve(resultat.getString("nomEleve"));
					historique.setPrenomEleve(resultat.getString("prenomEleve"));
					historique.setNomGroupe(resultat.getString("nomGroupe"));
					historiques.add(historique);
				}
			}catch (SQLException e) {
			e.printStackTrace();
			} 
		 
		return historiques;
	}
	
}
