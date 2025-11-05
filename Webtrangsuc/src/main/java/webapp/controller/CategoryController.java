package webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import webapp.models.Category;
import webapp.models.CategoryRepository;
import webapp.models.ProductRepository;

@Controller
public class CategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ProductRepository productRepository;

    @GetMapping("/category")
    public String index(Model model, @ModelAttribute("searchQuery") String searchQuery){
        Iterable<Category> list;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            list = categoryRepository.findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(searchQuery, searchQuery);
        } else {
            list = categoryRepository.findAll();
        }
        model.addAttribute("list", list);
        model.addAttribute("searchQuery", searchQuery);
        return "category/index";
    }

    @GetMapping("/category/add")
    public String add(Model model) {
        model.addAttribute("category", new Category());
        return "category/add";
    }

    @PostMapping("/category/add")
    public String add(@ModelAttribute Category category) {
        categoryRepository.save(category);
        return "redirect:/category";
    }

    @GetMapping("/category/edit/{categoryID}")
    public String edit(@PathVariable("categoryID") int categoryID, Model model) {
        Category category = categoryRepository.findById(categoryID).orElse(new Category()); 
        model.addAttribute("category", category);
        return "category/edit";
    }

    @PostMapping("/category/edit/{categoryID}")
    public String edit(@PathVariable("categoryID") int categoryID, @ModelAttribute Category category) {
        category.setCategoryID(categoryID);
        categoryRepository.save(category);
        return "redirect:/category";
    }

    @GetMapping("/category/delete/{categoryID}")
    public String delete(@PathVariable("categoryID") int categoryID, Model model) {
        long productCount = productRepository.countByCategory_CategoryID(categoryID);  
        if (productCount > 0) {
            model.addAttribute("errorMessage", "Vui lòng xóa hết sản phẩm thuộc danh mục này trước khi xóa danh mục.");
            return "category/index";
        }
        categoryRepository.deleteById(categoryID);
        return "redirect:/category";
    }

    @PostMapping("/category/save")
    public String saveCategory(@ModelAttribute("category") Category category) {
        categoryRepository.save(category);
        return "redirect:/category";
    }
}
