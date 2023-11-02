package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jacaranda.model.Employee;
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
	
//	public static <E> E add(Class<E> c, Object o) throws Exception {
//		Transaction transaction = null;
//		E result = null;
//		Session session = null;
//		try {
//			session = DbUtil.getSessionFactory().openSession();
//			transaction = session.beginTransaction();
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new Exception("Error en la base de datos.");
//		}
//		try {
//			session.persist(o);
//			transaction.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//			transaction.rollback();
//			throw new Exception("Error al obtener la entidad");
//		}
//		return result;
//	}
//	
//	public static <E> E delete(Class<E> c) throws Exception {
//		Transaction transaction = null;
//		E result = null;
//		Session session = null;
//		try {
//			session = DbUtil.getSessionFactory().openSession();
//			transaction = session.beginTransaction();
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new Exception("Error en la base de datos.");
//		}
//		try {
//			session.persist(result);
//			transaction.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//			transaction.rollback();
//			throw new Exception("Error al obtener la entidad");
//		}
//		return result;
//	}
	
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
	
}
