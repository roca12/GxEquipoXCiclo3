package com.roca12.misiontic2022.tiendalostiburones.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.roca12.misiontic2022.tiendalostiburones.DAO.ClienteDAO;
import com.roca12.misiontic2022.tiendalostiburones.DTO.ClienteVO;


@RestController
public class ClienteController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarcliente")
	public void registrarCliente(ClienteVO user) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarCliente(user);
	}

	@GetMapping("/consultarcliente")
	public ArrayList<ClienteVO> consultarClientes(Integer cedula) {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.consultarCliente(cedula);
	}

	@GetMapping("/listarclientes")
	public ArrayList<ClienteVO> listaDeClientes() {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.listaDeClientes();
	}
	
	@DeleteMapping("/eliminarcliente")
	public void eliminarCliente(Integer cedula) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarCliente(cedula);
	}
	
	@PutMapping("/actualizarcliente")
	public void actualizarCliente(ClienteVO user) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.actualizarCliente(user);
	}
	
}