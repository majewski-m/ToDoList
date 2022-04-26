package com.example.ToDoList.controller;

import com.example.ToDoList.entity.Item;
import com.example.ToDoList.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.List;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@GetMapping("/list")
	public String list(Model model) {

		model.addAttribute("localDate", LocalDate.now());

		List<Item> todoItems = itemService.findAllByOrderByDateAsc();

		model.addAttribute("todoItems", todoItems);

		return "list";
	}
}
