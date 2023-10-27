package com.jacaranda.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="project")
public class Project {
	
	@Id
	private int id;
	private String name;
	private String budget;
	
	@OneToMany(mappedBy="project")
	List<CompanyProject> companyProject;
	
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
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	
	public List<CompanyProject> getCompanyProject() {
		return companyProject;
	}
	public void setCompanyProject(List<CompanyProject> companyProject) {
		this.companyProject = companyProject;
	}
	@Override
	public int hashCode() {
		return Objects.hash(budget, id, name);
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
		return Objects.equals(budget, other.budget) && id == other.id && Objects.equals(name, other.name);
	}
	
	
	
}
