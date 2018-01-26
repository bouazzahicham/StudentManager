package DAO;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// daoFactory qui est present durant toute l'application
public class DAOConfig implements ServletContextListener
{
    private static final String ATT_DAO_FACTORY = "daoFactory";

    private   DAOFactory          daoFactory;

    @Override
    public void contextInitialized( ServletContextEvent event )
    {
        new Thread( new Runnable()
        {
            @Override
            public void run()
            {

                ServletContext servletContext = event.getServletContext();
                daoFactory = DAOFactory.getInstance();
        /* Enregistrement dans un attribut ayant pour portée toute l'application */
                servletContext.setAttribute(ATT_DAO_FACTORY, daoFactory);
            }
        } ).start();

    }

    @Override
    public void contextDestroyed( ServletContextEvent event )
    {
//    Que faire lors de la fermeture de l'application
    }
}

