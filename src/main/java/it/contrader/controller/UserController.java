package it.contrader.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import it.contrader.dto.UserDTO;
import it.contrader.service.BambinoService;
import it.contrader.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private BambinoService bambinoservice;

	@PostMapping("/login")
	public String login(HttpServletRequest request, @RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password) {
		try {

			UserDTO userDTO = service.findByUsernameAndPassword(username, password);
			request.getSession().setAttribute("user", userDTO);
			
			request.getSession().setAttribute("list", bambinoservice.findByIduser(userDTO.getIduser()));


			return "redirect:/parametro/analisibambino?idbambino="
			+ bambinoservice.findByIduser(userDTO.getIduser()).get(0).getIduser();
			
			
		}catch (Exception e) {
			return "index";
		}
	}

	@GetMapping("/getall")
	public String getAll(HttpServletRequest request) {
		setAll(request);
		return "users";
	}

	@GetMapping("/delete")
	public String delete(HttpServletRequest request, @RequestParam("id") int id) {
		service.delete(id);
		setAll(request);
		return "users";
	}

	@GetMapping("/preupdate")
	public String preUpdate(HttpServletRequest request, @RequestParam("id") int id) {
		request.getSession().setAttribute("dto", service.read(id));
		return "updateuser";
	}

	@PostMapping("/update")
	public String update(HttpServletRequest request, @RequestParam("id") int id, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("usertype") String usertype) {

		UserDTO dto = new UserDTO();
		dto.setIduser(id);
		dto.setUsername(username);
		dto.setPassword(password);
		service.update(dto);
		setAll(request);
		return "users";

	}

	@GetMapping("/register")
	public String preInsert(HttpServletRequest request, @RequestParam("id") int id) {
		request.getSession().setAttribute("dto", service.read(id));
		return "registrati";
	}

	@SuppressWarnings("finally")
	@PostMapping("/insert")
	public String insert(HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password) throws MySQLIntegrityConstraintViolationException {
		try {
			
		UserDTO dto = new UserDTO();
		dto.setUsername(username);
		dto.setPassword(password);
		service.insert(dto);
		setAll(request);
		} catch (Exception e) {
			
		}finally {	
		return "index";
		}
		
	}

	@GetMapping("/read")
	public String read(HttpServletRequest request, @RequestParam("id") int id) {
		request.getSession().setAttribute("dto", service.read(id));
		return "readuser";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index";
	}

	private void setAll(HttpServletRequest request) {
		request.getSession().setAttribute("list", service.getAll());
	}
}
