package test4.work.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import test4.work.entity.Category;

public interface CategoryRepository
        extends JpaRepository<Category, Integer> {

    List<Category>
    findByCategoryNameContainingIgnoreCase(String keyword);
}