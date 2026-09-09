package test4.work.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

import test4.work.entity.User;
import test4.work.repo.*;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository repository;

    public List<User> search(String keyword) {

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            return repository.findAll();
        }

        return repository.search(
                keyword.trim());
    }

    public User findById(Integer id) {

        return repository
                .findById(id)
                .orElse(null);
    }

    public User save(User user) {

        return repository.save(user);
    }

    public void delete(Integer id) {

        repository.deleteById(id);
    }
}