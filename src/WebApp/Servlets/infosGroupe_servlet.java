package WebApp.Servlets;

import DAO.DAOBeans.DAOSeanceImpl;
import DAO.DAOBeans.EleveImpl;
import DAO.DAOBeans.historiqueImpl;
import DAO.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class infosGroupe_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAOSeanceImpl seances;
	private EleveImpl eleves;
	private historiqueImpl histo;
	HttpSession mysession;
	Integer idgroupe=null,idseance=null;
    
    public infosGroupe_servlet() {
        super();
    }
    
    public void init() throws ServletException
	{
		DAOFactory daofact=DAOFactory.getInstance();
    	this.seances=daofact.getSeanceDao();
    	this.eleves=daofact.geteleveImpl();
    	this.histo=daofact.gethistoImpl();
    }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		Integer idgroupe=Integer.parseInt(request.getParameter("idgroupe"));
		mysession=request.getSession();
		mysession.setAttribute("eleves",eleves.lister(idgroupe));
		mysession.setAttribute("seances",seances.lister(1,idgroupe));/* recup�ration du premier parametre(id_utilisateur) apres authentfication*/
		mysession.setAttribute("histo",histo.lister_groupe(idgroupe));
		this.getServletContext().getRequestDispatcher("/WEB-INF/site/infos_groupe.jsp").forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
