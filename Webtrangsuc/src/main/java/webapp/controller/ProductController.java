package webapp.controller;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webapp.models.Category;
import webapp.models.CategoryRepository;
import webapp.models.Product;
import webapp.models.ProductRepository;

@Controller
public class ProductController {

    @Autowired
    private ProductRepository productRepository;
     @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping("/product")
    public String index(Model model, @RequestParam(value = "searchQuery", required = false) String searchQuery, @RequestParam(value = "categoryID", required = false) Integer categoryID) {
        Iterable<Product> product;
        if (searchQuery != null && !searchQuery.isEmpty() && categoryID != null) {
            product = productRepository.findByNameContainingIgnoreCaseAndCategory_CategoryID(searchQuery, categoryID);
        } else if (searchQuery != null && !searchQuery.isEmpty()) {
            product = productRepository.findByNameContainingIgnoreCase(searchQuery);
        } else if (categoryID != null) {
            product = productRepository.findAllByCategory_CategoryID(categoryID);
        } else {
            product = (List<Product>) productRepository.findAll();
        }
        model.addAttribute("product", product);
        model.addAttribute("searchQuery", searchQuery); 
        model.addAttribute("categoryID", categoryID); 
        model.addAttribute("category", categoryRepository.findAll()); 
        return "product/index";
    }

    @GetMapping("/product/add")
    public String add(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryRepository.findAll());  
        return "product/add";
    }
    @PostMapping("/product/add")
    public String add(@ModelAttribute("product") Product product){
        if (product.getCategoryID() != 0) {
            Optional<Category> optionalCategory = categoryRepository.findById(product.getCategoryID());
            if (optionalCategory.isPresent()) {
                product.setCategory(optionalCategory.get());
            } else {
                System.err.println("Category with ID " + product.getCategoryID() + " not found.");
            }
        }
        productRepository.save(product); 
        return "redirect:/product"; 
    }

    @GetMapping("/product/edit/{productID}")
    public String edit(@PathVariable("productID") int productID, Model model) {
        Product product = productRepository.findById(productID).orElse(new Product());
        model.addAttribute("product", product);
        model.addAttribute("categories", categoryRepository.findAll());
        return "product/edit";
    }
    @PostMapping("/product/edit/{productID}")
    public String edit(@PathVariable("productID") int productID, @ModelAttribute("product") Product product) {
        product.setProductID(productID);
        if (product.getCategoryID() != 0) {
            Optional<Category> optionalCategory = categoryRepository.findById(product.getCategoryID());
            if (optionalCategory.isPresent()) {
                product.setCategory(optionalCategory.get());
            }
        }
        productRepository.save(product);
        return "redirect:/product";
    }

    @GetMapping("/product/delete/{productID}")
    public String delete(@PathVariable("productID") int productID) {
        productRepository.deleteById(productID);
        return "redirect:/product";
    }

    @PostMapping("/product/save")
    public String saveProduct(@ModelAttribute("product") Product product) {
        productRepository.save(product);  
        return "redirect:/product";  
    }
}
