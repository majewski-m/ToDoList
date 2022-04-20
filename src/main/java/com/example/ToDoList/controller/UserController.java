package com.example.ToDoList.controller;

import com.example.ToDoList.entity.User;
import com.example.ToDoList.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@GetMapping("")
	public String viewHomePage() {
		return "index";
	}

	@GetMapping("/signup")
	public String showSignUpForm(Model model) {

		model.addAttribute("user", new User());

		return "signup_form";
	}

	@PostMapping("/process_signup")
	public String processRegistration(User user) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);

		userRepository.save(user);

		return "signup_success";
	}
}
