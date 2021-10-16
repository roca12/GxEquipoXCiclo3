package com.roca12.misiontic2022.tiendalostiburones.DAO;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite conectar con la base de datos
 */
public class Conexion {

	Logger logger= Logger.getLogger("com.roca12.misiontic2022.tiendalostiburones.DAO.Conexion");

	/** Parametros de conexion */
	static String nombre_base_datos = "tiendalostiburones";
	// root
	static String usuariobd = "admin";
	// mintic
	static String clavebd = "minticroca";
	// 127.0.0.1 == localhost
	static String url = "jdbc:mariadb://tiendasgenericasdr-g9-g38-53.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/" + nombre_base_datos;

	// objeto sin inicializar de la conexión
	Connection connection = null;

	/** Constructor de DbConnection */
	public Conexion() {
		try {
			// obtenemos el driver de para mysql
			Class.forName("org.mariadb.jdbc.Driver");
			// obtenemos la conexión
			connection = DriverManager.getConnection(url, usuariobd, clavebd);
			// si hay conexión correcta mostrar información en consola
			if (connection != null) {
				System.out.println("------------------------------------------------------");
				System.out.println("Conexión a base de datos " + nombre_base_datos + " OK");
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'a las' HH:mm:ss z");
				Date date = new Date(System.currentTimeMillis());
				System.out.println(formatter.format(date));
				System.out.println(url);
				System.out.println("------------------------------------------------------");
			}

		} catch (SQLException e) {
			// error de la base de datos
			System.out.println(e);
			logger.log(Level.WARNING, "Algo paso SQL");
	
		} catch (ClassNotFoundException e) {
			// error en carga de clases
			System.out.println(e);
			logger.log(Level.WARNING, "Algo paso CLASS");
		} catch (Exception e) {
			// cualquier otro error
			System.out.println(e);
			logger.log(Level.WARNING, "Otra cosa");
		}
	}

	/** Permite retornar la conexión */
	public Connection getConnection() {
		return connection;
	}

	// cerrando la conexión
	public void desconectar() {
		connection = null;
	}
}