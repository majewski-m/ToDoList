package com.example.ToDoList.controller;

import com.example.ToDoList.entity.Item;
import com.example.ToDoList.entity.User;
import com.example.ToDoList.service.ItemService;
import com.example.ToDoList.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private UserService userService;

	@GetMapping("/list")
	public String list(Model model) {

		List<Item> items = itemService.findAllByOrderByDateAsc();

		String email = SecurityContextHolder.getContext().getAuthentication().getName();

		User user = userService.findUserByEmail(email);


		model.addAttribute("items", items);
		model.addAttribute("userId", user.getId());

		System.out.println(user.getId());

		return "list";
	}
}
