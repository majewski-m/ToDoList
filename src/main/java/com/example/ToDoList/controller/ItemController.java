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
import org.springframework.web.bind.annotation.*;

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

//		Long userId = userService.findIdOfCurrentUser();

		Long userId = 1L; //TODO: DELETE IT AFTER TESTING

		model.addAttribute("items", items);
		model.addAttribute("userId", userId);

		return "list";
	}


	@GetMapping("/listPriority")
	public String listByPriority(Model model) {

		List<Item> items = itemService.findAllByOrderByPriorityAsc();

//		Long userId = userService.findIdOfCurrentUser();

		Long userId = 1L; //TODO: DELETE IT AFTER TESTING

		model.addAttribute("items", items);
		model.addAttribute("userId", userId);

		return "list";
	}

	@GetMapping("/getOne")
	@ResponseBody
	public Item getOne(Long id) {
		return itemService.getOne(id);
	}

	@PostMapping("/new")
	public String saveItem(Item item) {

		itemService.save(item);

		return "redirect:/list";
	}
	@GetMapping("/update")
	public String updateItem(Item item) {

		itemService.save(item);

		return "redirect:/list";
	}

	@GetMapping("/delete")
	public String delete(Long id) {

		itemService.deleteById(id);

		return "redirect:/list";
	}


}
