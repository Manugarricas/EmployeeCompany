package com.jacaranda;

import org.apache.commons.codec.digest.DigestUtils;

public class pruebaMd5 {
	
	public static void main(String[] args) {
		
		String cadenaEncriptada = DigestUtils.md5Hex("garri");
		System.out.println(cadenaEncriptada);
		
	}
	
}
