package com.roca12.misiontic2022.tiendalostiburones.DTO;

import java.io.Serializable;

public class ProveedorVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer nit_proveedor;
	private String ciudad_proveedor;
	private String direccion_proveedor;
	private String nombre_proveedor;
	private String telefono_proveedor;

	public Integer getNit_proveedor() {
		return nit_proveedor;
	}

	public void setNit_proveedor(Integer nit_proveedor) {
		this.nit_proveedor = nit_proveedor;
	}

	public String getCiudad_proveedor() {
		return ciudad_proveedor;
	}

	public void setCiudad_proveedor(String ciudad_proveedor) {
		this.ciudad_proveedor = ciudad_proveedor;
	}

	public String getDireccion_proveedor() {
		return direccion_proveedor;
	}

	public void setDireccion_proveedor(String direccion_proveedor) {
		this.direccion_proveedor = direccion_proveedor;
	}

	public String getNombre_proveedor() {
		return nombre_proveedor;
	}

	public void setNombre_proveedor(String nombre_proveedor) {
		this.nombre_proveedor = nombre_proveedor;
	}

	public String getTelefono_proveedor() {
		return telefono_proveedor;
	}

	public void setTelefono_proveedor(String telefono_proveedor) {
		this.telefono_proveedor = telefono_proveedor;
	}

}
