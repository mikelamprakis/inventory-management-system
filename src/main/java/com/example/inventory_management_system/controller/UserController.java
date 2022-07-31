package com.example.inventory_management_system.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.inventory_management_system.model.User;
import com.example.inventory_management_system.repository.UserDao;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;

	@GetMapping("UserProfile")
	public ModelAndView login(HttpSession session) {
		int userId = (int) session.getAttribute(LoginController.USER_ID);
		Optional<User> currentUser = userDao.findById(userId);
		if (!currentUser.isPresent()) {
			return new ModelAndView("errorPage.jsp", "error", "The selected user does not exist");
		}
		return new ModelAndView("PAGES/user/userProfile.jsp", "user", currentUser.get());
	}

	@GetMapping("go-to-dashboard")
	public ModelAndView goToDashboard(HttpSession session){
		ModelAndView mv = new ModelAndView();
		int userId = (int) session.getAttribute(LoginController.USER_ID);
		User currentUser = userDao.findById(userId).get();
		mv.addObject("user", currentUser);
		mv.setViewName(currentUser.getUserType().getName().equals("ADMIN") ? "PAGES/user/adminDashboard.jsp" : "PAGES/user/clientDashboard.jsp");
		return mv ;
	}


}
