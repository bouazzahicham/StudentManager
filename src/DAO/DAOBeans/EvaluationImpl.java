package DAO.DAOBeans;


import DAO.DAOFactory;
import WebApp.Beans.Evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EvaluationImpl {
    DAOFactory df;
    PreparedStatement st=null;
    ResultSet resultat=null;
    Connection con=null;

    public EvaluationImpl(DAOFactory DF)
    {
        this.df=DF;
    }

    public List<Evaluation> lister_eleve(Integer ideleve)
    {
        List<Evaluation> Evaluations=new ArrayList<Evaluation>();
        try {
            con=df.getConnection();
            st=con.prepareStatement("select * from view5 where  ideleve=?;");
            st.setInt(1,ideleve);
            resultat=st.executeQuery();

            while(resultat.next())
            {
                Evaluation  evaluation=new Evaluation();
                evaluation.setDateEvaluation(resultat.getString("dateEvaluation"));
                evaluation.setNoteEleve(resultat.getDouble("noteEleve"));
                evaluation.setDomaine(resultat.getString("Domaine"));
                evaluation.setPointsMaxEvaluation(resultat.getDouble("pointsMaxEvaluation"));
                Evaluations.add(evaluation);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return Evaluations;
    }

    public List<Evaluation> lister_groupe(Integer idgroupe,Integer idEvaluation)
    {
        List<Evaluation> Evaluations=new ArrayList<Evaluation>();
        try {
            con=df.getConnection();
            st=con.prepareStatement("select * from view5 where  idGroupe=? and idEvaluation=?;");
            st.setInt(1,idgroupe);
            st.setInt(2,idEvaluation);
            resultat=st.executeQuery();

            while(resultat.next())
            {
                Evaluation  evaluation=new Evaluation();
                evaluation.setDateEvaluation(resultat.getString("dateEvaluation"));
                evaluation.setNoteEleve(resultat.getDouble("noteEleve"));
                evaluation.setDomaine(resultat.getString("Domaine"));
                evaluation.setPointsMaxEvaluation(resultat.getDouble("pointsMaxEvaluation"));
                evaluation.setNomEleve(resultat.getString("nomEleve"));
                evaluation.setPrenomEleve(resultat.getString("prenomEleve"));
                evaluation.setIdEleve(resultat.getInt("idEleve"));
                evaluation.setNomGroupe(resultat.getString("nomGroupe"));
                Evaluations.add(evaluation);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally
        {
            try
            {
                con.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }


        }

        return Evaluations;
    }

    public List<Evaluation> lister()
    {
        List<Evaluation> Evaluations=new ArrayList<Evaluation>();
        try {
            con=df.getConnection();
            st=con.prepareStatement("select * from evaluation ");
            resultat=st.executeQuery();

            while(resultat.next())
            {
                Evaluation  evaluation=new Evaluation();
                evaluation.setDateEvaluation(resultat.getString("dateEvaluation"));
                evaluation.setDomaine(resultat.getString("Domaine"));
                evaluation.setIdEvaluation(resultat.getInt("idEvaluation"));
                Evaluations.add(evaluation);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        try
        {
            con.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        return Evaluations;
    }
}
