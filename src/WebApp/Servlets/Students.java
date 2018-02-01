package WebApp.Servlets;

import DAO.DAOBeans.AbsenceImpl;
import DAO.DAOFactory;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class Students extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AbsenceImpl absences;
	HttpSession mysession;
	DAOFactory daofact;
	Integer idgroupe=null,idseance=null;
	
    public Students() {
        super();
    }
    
    public void init() throws ServletException {
    	daofact=DAOFactory.getInstance();
    	this.absences=daofact.getabImpl();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("myids")!=null) {
			String yo=request.getParameter("myids").toString();
			String test=yo.trim();
			String[] loo=test.split(",");
			ArrayList<Integer> mesids = new ArrayList<Integer>();
			Integer seasel=Integer.parseInt(request.getParameter("seasel"));
			for(int i=0;i<loo.length;i++)
			{
				mesids.add(Integer.parseInt(loo[i].trim()));
			}

			absences.insererAbsence(mesids, seasel);

            response.sendRedirect("/accueil");
        }
	
	
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		doGet(request, response);
	}

}
