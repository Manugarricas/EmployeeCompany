package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jacaranda.model.CompanyProject;
import com.jacaranda.model.Employee;
import com.jacaranda.model.EmployeeProject;
import com.jacaranda.model.Project;
import com.jacaranda.model.User;
import com.jacaranda.util.DbUtil;

public class DbRepository {
	
	public static <E> E find(Class<E> c, int id) throws Exception {
		Session session;
		E result;
		try {
			session = DbUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error en la base de datos.");
		}
		try {
			result = session.find(c, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error al obtener la entidad");
		}
		return result;
	}
	
	public static <E> E find(Class<E> c, String id) throws Exception {
		Session session;
		E result;
		try {
			session = DbUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error en la base de datos.");
		}
		try {
			result = session.find(c, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error al obtener la entidad");
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public static <E> List<E> findAll(Class<E> c) throws Exception {
		Session session = null;
		List<E> resultList = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error en la base de datos.");
		}
		try {
			resultList = (List<E>)session.createSelectionQuery("From " + c.getName() ).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error al obtener la entidad");
		}
		return resultList;
	}
	
	public static void addEmployee(Employee e) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Error en la base de datos.");
		}
		try {
			session.merge(e);
			transaction.commit();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Eror al introducir el dato.");
		}
		session.close();
	}
	
	public static void deleteEmployee(Employee e) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Error en la base de datos.");
		}
		try {
			session.remove(e);
			transaction.commit();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Eror al introducir el dato.");
		}
		session.close();
	}
	
	public static void addCompanyProject(CompanyProject cp) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al conectar con la base de datos");
		}
		try {
			session.persist(cp);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
		session.close();
	}
	
	public static void deleteCompanyProject(CompanyProject cp) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error en la base de datos.");
		}
		try {
			session.remove(cp);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
		session.close();
	}
	
	public static void addProject(Project project) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al conectar con la base de datos.");
		}
		try {
			session.merge(project);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
		session.close();
	}
	
	public static void deleteProject(Project project) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error en la base de datos.");
		}
		try {
			session.merge(project);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
	}
	
	public static void updateEmployee(Employee e) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Error en la base de datos.");
		}
		try {
			session.merge(e);
			transaction.commit();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
	}
	
	public static void updateUser(User u) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Error en la base de datos.");
		}
		try {
			session.merge(u);
			transaction.commit();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
	}
	
	public static void addEmployeeProject(EmployeeProject ep) {
		Transaction transaction = null;
		Session session = null;
		try  {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error en la base de datos");
		}
		try {
			session.persist(ep);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al introducir el dato.");
		}
		session.close();	
	}
	
}
