package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;

@Controller
public class LanguageController {
	
	@Autowired
	LanguageService languageService;

	
	@GetMapping("")
	public String index() {
		return "redirect:/languages";
	}
	
	@GetMapping("/languages")
	public String main(@ModelAttribute("language") Language language, Model model) {
		List<Language> languages = languageService.allLanguage();
		model.addAttribute("languages", languages);
		return "index.jsp";
	}
	
	@GetMapping("/languages/{id}")
	public String getLang(@PathVariable("id") Long id, Model model) {
		Language languages = languageService.findLanguage(id);
		model.addAttribute("languages", languages);
		return "show.jsp";
	}
	
	//Create a language
	
	@PostMapping("/languages")
	public String create(
			@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	// Edit Language portion
	
	@GetMapping("/languages/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language languages = languageService.findLanguage(id);
		model.addAttribute("language", languages);
		return "edit.jsp";
	}
	
	@PutMapping("/languages/{id}")
	public String update(
			@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			languageService.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	
	//Delete Language Portion
	
	@DeleteMapping("/languages/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		languageService.destoryLanguage(id);
		return "redirect:/languages";
	}
	
	
}
