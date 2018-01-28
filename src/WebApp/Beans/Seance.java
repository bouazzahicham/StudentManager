package WebApp.Beans;

import DAO.DAOFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Hicham on 28/01/2018.
 */
public class Seance
{

    Integer idSeance;
    String dateSeance,dureeSeance,nomProprietaire,creneauGroupe,app,nomGroupe;

    public String getNomGroupe() {
        return nomGroupe;
    }
    public void setNomGroupe(String nomGroupe) {
        this.nomGroupe = nomGroupe;
    }
    public String getCreneauGroupe() {
        return creneauGroupe;
    }
    public void setCreneauGroupe(String creneauGroupe) {
        this.creneauGroupe = creneauGroupe;
    }

    public String getApp() {
        return app;
    }
    public void setApp(String app) {
        this.app = app;
    }
    public String getNomProprietaire() {
        return nomProprietaire;
    }
    public void setNomProprietaire(String nomProprietaire) {
        this.nomProprietaire = nomProprietaire;
    }
    public Integer getIdSeance() {
        return idSeance;
    }
    public void setIdSeance(Integer idseance) {
        this.idSeance = idseance;
    }
    public String getDateSeance() {
        return dateSeance;
    }
    public void setDateSeance(String dateSeance) {
        this.dateSeance = dateSeance;
    }
    public String getDureeSeance() {
        return dureeSeance;
    }
    public void setDureeSeance(String dureeSeance) {
        this.dureeSeance = dureeSeance;
    }
}
