package test4.work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

import test4.work.entity.Category;
import test4.work.repo.CategoryRepository;

@Service
@RequiredArgsConstructor
public class CategoryService {

    private final CategoryRepository repository;

    public List<Category> search(String keyword) {

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            return repository.findAll();
        }

        return repository
                .findByCategoryNameContainingIgnoreCase(
                        keyword.trim());
    }

    public Category findById(Integer id) {

        return repository
                .findById(id)
                .orElse(null);
    }

    public Category save(Category category) {

        return repository.save(category);
    }

    public void delete(Integer id) {

        repository.deleteById(id);
    }
}