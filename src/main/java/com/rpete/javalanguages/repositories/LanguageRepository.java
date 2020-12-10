package com.rpete.javalanguages.repositories;

import java.awt.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rpete.javalanguages.models.Language;

@Repository
public interface LanguageRepository extends CrudRepository<Language, Long> {
	// this method retrieves all the languages from the database
    List<Language> findAll();
    // this method finds languages with descriptions containing the search string
    List<Language> findByDescriptionContaining(String string);
    // this method counts how many languages contain a certain string
    Long countByNameContaining(String search);
    // this method deletes a language that starts with a specific name
    Long deleteByNameStartingWith(String search);
}
