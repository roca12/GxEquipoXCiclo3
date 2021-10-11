package com.roca12.misiontic2022.tiendalostiburones.DTO;

import java.io.Serializable;

public class VentaVO implements Serializable {
	
	//identificador unico de las clases entidad
		private static final long serialVersionUID = 1L;
		
		private Integer codigo_venta;
		private Integer cedula_cliente;
		private Integer cedula_usuario;
		private Double ivaventa;
		private Double total_venta;
		private Double valor_venta;
		
				
		public Integer getCodigo_venta() {
			return codigo_venta;
		}
		public void setCodigo_venta(Integer codigo_venta) {
			this.codigo_venta = codigo_venta;
		}
		public Integer getCedula_cliente() {
			return cedula_cliente;
		}
		public void setCedula_cliente(Integer cedula_cliente) {
			this.cedula_cliente = cedula_cliente;
		}
		public Integer getCedula_usuario() {
			return cedula_usuario;
		}
		public void setCedula_usuario(Integer cedula_usuario) {
			this.cedula_usuario = cedula_usuario;
		}
		public Double getIvaventa() {
			return ivaventa;
		}
		public void setIvaventa(Double ivaventa) {
			this.ivaventa = ivaventa;
		}
		public Double getTotal_venta() {
			return total_venta;
		}
		public void setTotal_venta(Double total_venta) {
			this.total_venta = total_venta;
		}
		public Double getValor_venta() {
			return valor_venta;
		}
		public void setValor_venta(Double valor_venta) {
			this.valor_venta = valor_venta;
		}
		
		
}
