package com.example.inventory_management_system.controller;
import java.time.ZonedDateTime;
import javax.servlet.http.HttpSession;
import com.example.inventory_management_system.model.User;
import com.example.inventory_management_system.repository.BasketDao;
import com.example.inventory_management_system.repository.UserDao;
import com.example.inventory_management_system.model.Basket;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	public static final String USER_ID = "USER_ID";
	public static final String LOGIN_PAGE = "login.jsp";
	private static Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private BasketDao basketDao;
	
	@GetMapping("Login")
	public ModelAndView login() {
		return new ModelAndView(LOGIN_PAGE, "user", new User());
	}

	@GetMapping("ClientHome")
	public ModelAndView goToClientHome() {
		return new ModelAndView("PAGES/user/clientDashboard.jsp");
	}

	@GetMapping("AdminHome")
	public ModelAndView goToAdminHome() {
		return new ModelAndView("PAGES/user/adminDashboard.jsp");
	}

	@PostMapping("LoginSubmit")
	public String loginSubmit(@ModelAttribute("user")User user,
			Model model,
			HttpSession session) {

		User userFromDatabase = userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (userFromDatabase == null) {
			model.addAttribute("message", "Incorrect user name or password");
			return LOGIN_PAGE;
		}
		session.setAttribute(USER_ID, userFromDatabase.getId());
		model.addAttribute("user", userFromDatabase);
		return userFromDatabase.getUserType().getName().equals("ADMIN") ? "PAGES/user/adminDashboard.jsp" : "PAGES/user/clientDashboard.jsp";
	}
	
	@RequestMapping("/Logout")
	public ModelAndView logout(HttpSession session){
		Object idFromSession = session.getAttribute(LoginController.USER_ID);
		if (idFromSession != null){
			int userId = (int) session.getAttribute(LoginController.USER_ID);
			logger.warn("User {} logged out at {}", userDao.findById(userId).get().getUsername(), ZonedDateTime.now());
		}

		for (Basket basket : basketDao.findAll()){
			if (basket.getStatus().getName().equals("OPEN")){
				basketDao.delete(basket);
			}
		}

		session.invalidate();
		return new ModelAndView(LOGIN_PAGE, "user", new User());
	}
}
