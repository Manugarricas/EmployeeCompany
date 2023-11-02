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

	public Project(String name, String butget) {
		super();
		this.name = name;
		this.butget = butget;
	}

	@OneToMany(mappedBy = "project")
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
