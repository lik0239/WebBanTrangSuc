package webapp.models;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Integer> {
    List<Category> findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(String name, String description);
}
