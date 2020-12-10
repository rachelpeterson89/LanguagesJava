package com.rpete.javalanguages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rpete.javalanguages.models.Language;
import com.rpete.javalanguages.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
		this.languageService = languageService;
	}
	
	@RequestMapping("")
	public String home() {
		return "redirect:/languages";
	}
	
	@RequestMapping("/languages")
	public String index(Model model, @ModelAttribute("language") Language language) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		return "/languages/index.jsp";
	}
	
//	@RequestMapping(value="/languages/create", method=RequestMethod.GET)
//	public String create(Model model) {
//		model.addAttribute("language", new Language());
//		return "language added";
//	}
	
	@RequestMapping(value="/languages/create", method=RequestMethod.POST)
	public String processCreate(@Valid @ModelAttribute("language") Language language, Model model, BindingResult result) {
		if (result.hasErrors()) {
//			List<Language> languages = languageService.allLanguages();
//			model.addAttribute("languages", languages);
			return "/languages/index.jsp";
		} else {
			model.addAttribute("language", new Language());
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/languages/{id}")
	public String showOne(@PathVariable("id") Long id, Model model) {
		Language oneLanguage = languageService.findLanguage(id);
		model.addAttribute("language", oneLanguage);
		return "/languages/showOne.jsp";
	}
	
	// when user visits /languages/1/edit, shows them page with a form to edit language  with id=1
	@RequestMapping("/languages/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "/languages/edit.jsp";
	}
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) {
            return "/languages/edit.jsp";
        } else {
            languageService.update(language);
            return "redirect:/languages";
        }
    }
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}

//	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
//	public String update(@ModelAttribute("name") String name, @ModelAttribute("creator") String creator, @ModelAttribute("version") String version, BindingResult result) {
//		if (result.hasErrors()) {
//			return "/books/edit.jsp";
//		} else {
//			languageService.updateLanguage(String name, String creator, String version);
//			return "redirect:/languages";
//		}
//	}
	
//	@RequestMapping("/languages/edit/{id}")
//	public String update(@PathVariable("id") Long id, @PathVariable("name") String name, @PathVariable("creator") String creator, @PathVariable("version") String version, Model model) 	{
//		Language updateLanguage = languageService.updateLanguage(id, name, creator, version)
//	}
}
