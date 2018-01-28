package WebApp.Servlets;


import DAO.DAOBeans.AbsenceImpl;
import DAO.DAOBeans.EvaluationImpl;
import DAO.DAOBeans.historiqueImpl;
import DAO.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class infosEtudiant_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private historiqueImpl histo;
	private AbsenceImpl absences;
	private EvaluationImpl evaluations;
	HttpSession mysession;
	Integer ideleve;
       
     
    public infosEtudiant_servlet() {
        super();
    }

    public void init() throws ServletException {
		DAOFactory daofact=DAOFactory.getInstance();
    	this.absences=daofact.getabImpl();
    	this.histo=daofact.gethistoImpl();
    	this.evaluations=daofact.getevaluationImpl();
    }
	 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		mysession=request.getSession();
		ideleve=Integer.parseInt(request.getParameter("ideleve"));
		mysession.setAttribute("histo",histo.lister_eleve(ideleve));
		mysession.setAttribute("absences",absences.lister(ideleve));
		mysession.setAttribute("evaluations",evaluations.lister_eleve(ideleve));
		mysession.setAttribute("ideleve",ideleve);
		this.getServletContext().getRequestDispatcher("/WEB-INF/infos_etudiant.jsp").forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doGet(request, response);
	}

}
