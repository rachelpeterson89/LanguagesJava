package com.rpete.javalanguages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.rpete.javalanguages.models.Language;
import com.rpete.javalanguages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	// returns all languages
	public List<Language> allLanguages() {
		return (List<Language>) languageRepository.findAll();
	}
	
	// creates a new language
	public Language createLanguage(Language l) {
		return languageRepository.save(l);
	}
	
	// retrieves a language by id
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if (optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
	
	// method for updating from jsp form
	public Language update(Language l) {
		return languageRepository.save(l);
	}
	
	// updates a language
	public Language updateLanguage(Long id, String name, String creator, String version) {
		Language optionalLanguage = this.findLanguage(id);
		optionalLanguage.setName(name);
		optionalLanguage.setCreator(creator);
		optionalLanguage.setVersion(version);
		return languageRepository.save(optionalLanguage);
	}
	
	// deletes a language by id
	public void deleteLanguage(Long id) {
		languageRepository.deleteById(id);
		return;
	}
}
