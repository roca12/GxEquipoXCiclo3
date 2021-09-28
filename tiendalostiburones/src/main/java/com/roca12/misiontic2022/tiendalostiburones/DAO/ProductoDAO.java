package com.roca12.misiontic2022.tiendalostiburones.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.roca12.misiontic2022.tiendalostiburones.DTO.ProductoVO;

public class ProductoDAO {
	
	public void registrarProducto(ProductoVO product) {
		//llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			//sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();
			
			//String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO productos VALUES(" 
					+ product.getCodigo_producto() + "," 
					+ product.getIva_compra() + ","
					+ product.getNit_proveedor() + ",'" 
					+ product.getNombre_producto()+ "'," 
					+ product.getPrecio_compra() + "," 
					+ product.getPrecio_venta() + "" 
					+ ");";
			
			//se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			//impresión en consola para verificación 
			System.out.println("Registrado " + sentencia);
			//cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}


	public ArrayList<ProductoVO> consultarProducto(Integer product) {	
		//lista que contendra el o los productos obtenidos
		ArrayList<ProductoVO> listaproductos = new ArrayList<ProductoVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM productos where codigo_producto = ? ");		
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la funcion
			consulta.setInt(1, product);			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ProductoVO newproducto = new ProductoVO();
				newproducto.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				newproducto.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				newproducto.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				newproducto.setNombre_producto(res.getString("nombre_producto"));
				newproducto.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				newproducto.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaproductos.add(newproducto);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaproductos;
	}


	public ArrayList<ProductoVO> listaDeProductos() {
		//lista que contendra el o los productos obtenidos
		ArrayList<ProductoVO> listaproductos = new ArrayList<ProductoVO>();
		
		//instancia de la conexión
		Conexion conex = new Conexion();

		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos");
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			
			//cree un objeto para cada encontrado en la base de datos basado en la clase entidad con los datos encontrados
			while (res.next()) {
				ProductoVO newproducto = new ProductoVO();
				newproducto.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				newproducto.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				newproducto.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				newproducto.setNombre_producto(res.getString("nombre_producto"));
				newproducto.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				newproducto.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaproductos.add(newproducto);
			}
			
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaproductos;
	}

	public void eliminarProducto(Integer codigo_producto) {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "delete from productos where codigo_producto=" + codigo_producto + ";";
			
			//impresion de verificación
			System.out.println("Registrado " + sentencia);
			
			//ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);
			
			//cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public void actualizarProducto(ProductoVO product) {
		
		//instancia de conexion
		Conexion conex = new Conexion();

		try {
			//inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();
			
			//String con la sentencia a ejecutar
			String sentencia = "UPDATE productos "
					+ "SET iva_compra = "+product.getIva_compra()+","
					+ "nombre_producto = '"+product.getNombre_producto()+"',"
					+ "nit_proveedor = "+product.getNit_proveedor()+","
					+ "precio_compra = "+product.getPrecio_compra()+","
					+ "precio_venta = "+product.getPrecio_venta()+""
					+ "WHERE codigo_producto = "+product.getCodigo_producto()+";";
			
			//ejecuta la sentencia 
			estatuto.executeUpdate(sentencia);
			
			//verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);
			
			//cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar  el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}
	
	
	public void eliminarTodoProducto() {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "delete from productos;";
			
			//impresion de verificación
			System.out.println("Registrado " + sentencia);
			
			//ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);
			
			//cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

}
