package DAO;

import com.jolbox.bonecp.BoneCP;
import com.jolbox.bonecp.BoneCPConfig;
import DAO.DAOBeans.* ;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by Hicham on 04/09/2017.
 */
public class DAOFactory
{
    static  BoneCP boneCP = null ; // Objet de connection a la base de donnée

    private static final String url_propreties       = "DAO/properties.txt";

    DAOFactory(BoneCP boneCP ) {
        this.boneCP =  boneCP ;

    }
    public Connection getConnection() throws SQLException
    {
//        return  DriverManager.getConnection(url,user,mdp);
        return boneCP.getConnection();
    }

    public static DAOFactory getInstance() throws DAOException
    {
        Properties properties = new Properties();

        String url ;
        String driver ;
        String username ;
        String mdp ;
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream fileProperties = classLoader.getResourceAsStream(url_propreties);

        if(fileProperties == null )
            throw new DAOException("\n\n\nChargement du fichier propriétés a échoué !\nChemin : "+url_propreties+"\n\n");

        try
        {
            properties.load(fileProperties);
            url = properties.getProperty("url");
            driver = properties.getProperty("driver");
            username = properties.getProperty("username");
            mdp = properties.getProperty("password");

            System.out.println("\n"+url+"\n"+username+"\n"+driver+"\n"+mdp);

        } catch (IOException e)
        {
            throw new DAOException("Le fichier 'properties.txt' est mal configuré  ");
        }
        try
        {
            //Chargement dynamique du driver
            Class.forName(driver);

        } catch (ClassNotFoundException e)
        {
            throw new DAOException("Le driver JDBC est introuvable !");

        }

        try
        {

            BoneCPConfig config = new BoneCPConfig();
            config.setJdbcUrl(url);
            config.setUsername(username);
            config.setPassword(mdp);

            config.setMinConnectionsPerPartition(5);
            config.setMaxConnectionsPerPartition(10);
            config.setPartitionCount(2); // A modifier
            boneCP = new BoneCP(config);

            System.out.println(boneCP);
        }
        catch  (Exception e )
        {
            System.out.println("\n\nErreur d'initialisation du BoneCP \n\n ");

        }



        DAOFactory instance = new DAOFactory(boneCP);
        return instance ;

    }






    public DAOUtilisateur getUtilisateurDao() {
        return new DAOUtilisateurImpl( this );

    }
    public DAOGroupeImpl getGroupeDao()
    {
        return new DAOGroupeImpl(this);
    }
    public DAOSeanceImpl getSeanceDao()
    {
        return new DAOSeanceImpl(this);
    }


}
