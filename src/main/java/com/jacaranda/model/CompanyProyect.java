package com.jacaranda.model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="companyProyect")
public class CompanyProyect {
	
	@Id
	private int idCompany;
	
	@Id
	@ManyToOne
	private int idProyect;
	
	@Id
	private Date begin;
	
	private Date end;
	
}
