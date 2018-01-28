package WebApp.Beans;

public class Evaluation {
	Integer idEvaluation,idEleve;
	Double pointsMaxEvaluation,noteEleve;
	String dateEvaluation,domaine,nomEleve,prenomEleve,nomGroupe;
	
	
	public String getNomGroupe() {
		return nomGroupe;
	}
	public void setNomGroupe(String nomGroupe) {
		this.nomGroupe = nomGroupe;
	}
	public Integer getIdEleve() {
		return idEleve;
	}
	public void setIdEleve(Integer idEleve) {
		this.idEleve = idEleve;
	}
	public String getNomEleve() {
		return nomEleve;
	}
	public void setNomEleve(String nomEleve) {
		this.nomEleve = nomEleve;
	}
	public String getPrenomEleve() {
		return prenomEleve;
	}
	public void setPrenomEleve(String prenomEleve) {
		this.prenomEleve = prenomEleve;
	}
	public Integer getIdEvaluation() {
		return idEvaluation;
	}
	public void setIdEvaluation(Integer idEvaluation) {
		this.idEvaluation = idEvaluation;
	}

	public Double getNoteEleve() {
		return noteEleve;
	}
	public void setNoteEleve(Double noteEleve) {
		this.noteEleve = noteEleve;
	}
	public Double getPointsMaxEvaluation() {
		return pointsMaxEvaluation;
	}
	public void setPointsMaxEvaluation(Double pointsMaxEvaluation) {
		this.pointsMaxEvaluation = pointsMaxEvaluation;
	}
	public String getDateEvaluation() {
		return dateEvaluation;
	}
	public void setDateEvaluation(String dateEvaluation) {
		this.dateEvaluation = dateEvaluation;
	}
	public String getDomaine() {
		return domaine;
	}
	public void setDomaine(String domaine) {
		this.domaine = domaine;
	}
	
}
