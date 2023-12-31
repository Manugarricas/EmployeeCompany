package com.jacaranda.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="user")
public class User {
	@Id
	@Column(name = "user")
	private String user;
	@Column(name = "password")
	private String password;
	@Column(name = "role")
	private String role;
	@Column(name="hoursWorked")
	private int hoursWorked;
	
	public User(String user, String password, String role) {
		super();
		this.user = user;
		this.password = password;
		this.role = role;
	}

	public User() {
		super();
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getHoursWorked() {
		return hoursWorked;
	}

	public void setHoursWorked(int hoursWorked) {
		this.hoursWorked = hoursWorked;
	}
	
	public void addHoursWorked(int hoursWorked) {
		this.hoursWorked += hoursWorked;
	}

	@Override
	public int hashCode() {
		return Objects.hash(user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(user, other.user);
	}

	@Override
	public String toString() {
		return this.user;
	}
	
}
