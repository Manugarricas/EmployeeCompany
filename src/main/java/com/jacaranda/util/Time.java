package com.jacaranda.util;

import java.time.LocalTime;

import com.jacaranda.model.User;
import com.jacaranda.repository.DbRepository;

public class Time {
	
	public static int horaActual() {
		LocalTime now = LocalTime.now();
		return (now.getHour()*3600)+(now.getMinute()*60)+(now.getSecond());
	}
	
	public static double computarTiempoTrabajo(int tiempoInicial, User user) {
		int tiempoTotal = horaActual() - tiempoInicial;
		try {
			user.addHoursWorked(tiempoTotal);
			DbRepository.updateUser(user);
		} catch (Exception e) {
			user.addHoursWorked(-tiempoTotal);
			e.printStackTrace();
		}
		return tiempoTotal;
	}
	
}
