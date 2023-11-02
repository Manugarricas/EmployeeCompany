package com.jacaranda.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "project")
public class Project {

	@Id
	private int id;
	private String name;
	private String butget;

	@OneToMany(mappedBy = "project")
	List<CompanyProject> companyProject;
	
	// Constructor sin argumentos (constructor predeterminado)
    public Project() {
    }

    // Constructor con argumentos que inicializa todos los campos de la clase
    public Project(int id, String name, String budget, List<CompanyProject> companyProject) {
        this.id = id;
        this.name = name;
        this.butget = budget;
        this.companyProject = companyProject;
    }

    // Constructor sin el campo "id"
    public Project(String name, String budget, List<CompanyProject> companyProject) {
        this.name = name;
        this.butget = budget;
        this.companyProject = companyProject;
    }

    // Constructor sin el campo "companyProject"
    public Project(int id, String name, String budget) {
        this.id = id;
        this.name = name;
        this.butget = budget;
    }

    // Constructor sin los campos "id" y "companyProject"
    public Project(String name, String budget) {
        this.name = name;
        this.butget = budget;
    }

    // Constructor copia
    public Project(Project other) {
        this.id = other.id;
        this.name = other.name;
        this.butget = other.butget;
        this.companyProject = other.companyProject;
    }
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getButget() {
		return butget;
	}

	public void setBudget(String butget) {
		this.butget = butget;
	}

	public List<CompanyProject> getCompanyProject() {
		return companyProject;
	}

	public void setCompanyProject(List<CompanyProject> companyProject) {
		this.companyProject = companyProject;
	}

	@Override
	public int hashCode() {
		return Objects.hash(butget, id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Project other = (Project) obj;
		return Objects.equals(butget, other.butget) && id == other.id && Objects.equals(name, other.name);
	}

	@Override
	public String toString() {
		return String.format("Name: %s, id: %s, budget: %s.", this.getName(), this.getId(), this.getButget());
	}

}
