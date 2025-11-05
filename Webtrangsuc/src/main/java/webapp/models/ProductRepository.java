package webapp.models;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer> {
    List<Product> findByNameContainingIgnoreCase(String name);
    List<Product> findAllByCategory_CategoryID(int categoryID);
    List<Product> findByNameContainingIgnoreCaseAndCategory_CategoryID(String name, int categoryID);
    long countByCategory_CategoryID(int categoryID);
}
