package WebApp.Servlets;

import DAO.DAO_FACTORY;
import DAO.UtilisateurDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class test extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurdao;
	private DAO.groupImpl groupImpl;
	private DAO.seanceImpl seanceImpl;
	
    public test() {
        super();
    }
    
    public void init() throws ServletException
    {
    	DAO_FACTORY daofact=DAO_FACTORY.getInstance();
    	this.utilisateurdao=daofact.getUtilisateurDao();
    	this.groupImpl=daofact.getgroupImpl();
    	this.seanceImpl=daofact.getseanceImpl();
    }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("mygroups",groupImpl.lister());
		this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(request.getParameter("groupetds") != null) {
			request.setAttribute("mygroups",groupImpl.lister());
			request.setAttribute("messeances",seanceImpl.lister());
		}
		
		if(request.getParameter("seances") != null) {
			request.setAttribute("mygroups",groupImpl.lister());
			request.setAttribute("messeances",seanceImpl.lister());
			request.setAttribute("etudiants",utilisateurdao.lister());
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}
	

}
