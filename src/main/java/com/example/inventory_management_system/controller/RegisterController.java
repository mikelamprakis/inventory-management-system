package com.example.inventory_management_system.controller;
import com.example.inventory_management_system.model.Admin;
import com.example.inventory_management_system.model.Client;
import com.example.inventory_management_system.model.enums.AccessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.inventory_management_system.model.User;
import com.example.inventory_management_system.repository.UserDao;
import java.util.EnumSet;

@Controller
public class RegisterController {

	@Autowired
	private UserDao userDao;

	@GetMapping("Register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("types", EnumSet.allOf(AccessType.class));
		return "register.jsp";
	}
	
	@PostMapping("RegisterSubmit")
	public String registerSubmit(
			@ModelAttribute("user")User user,
			Model model) {
		
		User userFromDatabase = userDao.findByUsername(user.getUsername());
		if (userFromDatabase != null) {
			model.addAttribute("message", "This user name already exists");
			model.addAttribute("types", EnumSet.allOf(AccessType.class));
			return "register.jsp";
		}

		if (user.getUserType().getName().equals("ADMIN")){
			Admin newUser = new Admin(user.getUsername(), user.getPassword());
			userDao.save(newUser);
		}else{
			Client newUser = new Client(user.getUsername(), user.getPassword());
			userDao.save(newUser);
		}
		return "login.jsp";
	}
}
