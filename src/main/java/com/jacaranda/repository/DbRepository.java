package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

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
	
	public static <E> E addToBd(Class<E> c) throws Exception {
		Transaction transaction = null;
		Session session;
		E result;
		try {
			session = DbUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error en la base de datos.");
		}
		try {
			session.merge(result);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Error al obtener la entidad");
		}
		return result;
	}
	
}
