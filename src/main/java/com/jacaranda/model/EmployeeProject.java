package com.jacaranda.model;

import java.sql.Date;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="employeeProject")
public class EmployeeProject {
	@Id
	private String user;
	@Id
	private int idProject;
	@Id
	private Date date;
	private double hours;
	
	public EmployeeProject(String user, int idProject, Date date, double hours) {
		super();
		this.user = user;
		this.idProject = idProject;
		this.date = date;
		this.hours = hours;
	}
	
	public EmployeeProject(String user, int idProject, Date date) {
		super();
		this.user = user;
		this.idProject = idProject;
		this.date = date;
	}

	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getIdProject() {
		return idProject;
	}
	public void setIdProject(int idProject) {
		this.idProject = idProject;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getHours() {
		return hours;
	}
	public void setHours(double hours) {
		this.hours = hours;
	}
	public void addHours(double hours) {
		this.hours += hours;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(date, idProject, user);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EmployeeProject other = (EmployeeProject) obj;
		return Objects.equals(date, other.date) && idProject == other.idProject && Objects.equals(user, other.user);
	}
	
	@Override
	public String toString() {
		return "EmployeeProject [user=" + user + ", idProject=" + idProject + ", date=" + date + ", hours=" + hours
				+ "]";
	}
}
