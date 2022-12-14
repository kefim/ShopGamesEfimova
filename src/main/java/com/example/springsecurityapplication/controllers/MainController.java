package com.example.springsecurityapplication.controllers;

import com.example.springsecurityapplication.repositories.ProductRepository;
import com.example.springsecurityapplication.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/product")
public class MainController {

    private final ProductRepository productRepository;
    private final ProductService productService;

    @Autowired
    public MainController(ProductRepository productRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.productService = productService;
    }

    // Данный метод предназначен для отображении товаров без прохождения аутентификации и авторизации
    @GetMapping("")
    public String getAllProduct(Model model){
        model.addAttribute("products", productService.getAllProduct());
        return "product/product";
    }

    @GetMapping("/info/{id}")
    public String infoProduct(@PathVariable("id") int id, HttpServletRequest httpServletRequest, Model model){
        model.addAttribute("product", productService.getProductId(id));
        if (httpServletRequest.isUserInRole("USER")) {
            return "user/infoProduct";

        } else {
            return "product/infoProductForNotAuth";
        }
    }

    @PostMapping("/search")
    public String productSearch(@RequestParam("search") String search, @RequestParam("ot") String ot, @RequestParam("do") String Do, @RequestParam(value = "price", required = false, defaultValue = "") String price, @RequestParam(value = "category", required = false, defaultValue = "") String category, Model model){
        System.out.println(search);
        System.out.println(ot);
        System.out.println(Do);
        System.out.println(price);
        System.out.println(category);
        // Если диапазон цен от и до не пустой
        if(!ot.isEmpty() & !Do.isEmpty()) {
            // Если сортировка по цене выбрана
            if (!price.isEmpty()) {
                // Если в качестве сортировки выбрана сортировка по возрастанию
                if (price.equals("sorted_by_ascending_price")) {
                    // Если категория товара не пустая
                    if (!category.isEmpty()) {
                        // Если категория равная "Детские"
                        if (category.equals("child")) {
                            model.addAttribute("search_product", productRepository.findByTitleAndCategoryOrderByPrice(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 3));
                            // Если категория равная "Вечериночные"
                        } else if (category.equals("party")) {
                            model.addAttribute("search_product", productRepository.findByTitleAndCategoryOrderByPrice(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 1));
                            // Если категория равная "Детективные"
                        } else if (category.equals("detect")) {
                            model.addAttribute("search_product", productRepository.findByTitleAndCategoryOrderByPrice(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 2));
                        }
                        // Если категория не выбрана
                    } else {
                        model.addAttribute("search_product", productRepository.findByTitleOrderByPrice(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do)));
                    }

                    // Если в качестве сортировки выбрана сортировка по убыванию
                } else if (price.equals("sorted_by_descending_price")) {

                    // Если категория не пустая
                    if (!category.isEmpty()) {
                        // Если категория равная "Детские"
                        if (category.equals("child")) {
                            model.addAttribute("search_product", productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 3));
                            // Если категория равная "Вечериночные"
                        } else if (category.equals("party")) {
                            model.addAttribute("search_product", productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 1));
                            // Если категория равная "Детективные"
                        } else if (category.equals("detect")) {
                            model.addAttribute("search_product", productRepository.findByTitleAndCategoryOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do), 2));
                        }
                        // Если категория не выбрана
                    }
                    else {
                        model.addAttribute("search_product", productRepository.findByTitleOrderByPriceDesc(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do)));
                    }
                }
            }
            else {
                model.addAttribute("search_product", productRepository.findByTitleAndPriceGreaterThanEqualAndPriceLessThan(search.toLowerCase(), Float.parseFloat(ot), Float.parseFloat(Do)));
            }
        } else {
            model.addAttribute("search_product",productRepository.findByTitleContaining(search));
        }
        model.addAttribute("value_search", search);
        model.addAttribute("value_price_ot", ot);
        model.addAttribute("value_price_do", Do);
        model.addAttribute("products", productService.getAllProduct());
        return "/product/product";
    }


    @PostMapping("/search1")
    public String productSearch1(@RequestParam("search1") String search1, @RequestParam("ot1") String ot1, @RequestParam("do1") String Do1, @RequestParam(value = "price", required = false, defaultValue = "") String price, @RequestParam(value = "category", required = false, defaultValue = "") String category, Model model){
        System.out.println(search1);
        System.out.println(ot1);
        System.out.println(Do1);
        System.out.println(price);
        System.out.println(category);
        // Если диапазон цен от и до не пустой
        if(!ot1.isEmpty() & !Do1.isEmpty()) {
            // Если сортировка по цене выбрана
            if (!price.isEmpty()) {
                // Если в качестве сортировки выбрана сортировка по возрастанию
                if (price.equals("sorted_by_ascending_price")) {
                    // Если категория товара не пустая
                    if (!category.isEmpty()) {
                        // Если категория равная "Детские"
                        if (category.equals("child")) {
                            model.addAttribute("search_product1", productRepository.findByTitleAndCategoryOrderByPrice(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1), 3));
                            // Если категория равная "Вечериночные"
                        } else if (category.equals("party")) {
                            model.addAttribute("search_product1", productRepository.findByTitleAndCategoryOrderByPrice(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1), 1));
                            // Если категория равная "Детективные"
                        } else if (category.equals("detect")) {
                            model.addAttribute("search_product1", productRepository.findByTitleAndCategoryOrderByPrice(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1), 2));
                        }
                        // Если категория не выбрана
                    } else {
                        model.addAttribute("search_product1", productRepository.findByTitleOrderByPrice(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1)));
                    }

                    // Если в качестве сортировки выбрана сортировка по убыванию
                } else if (price.equals("sorted_by_descending_price")) {

                    // Если категория не пустая
                    if (!category.isEmpty()) {
                        // Если категория равная "Детские"
                        if (category.equals("child")) {
                            model.addAttribute("search_product1", productRepository.findByTitleAndCategoryOrderByPriceDesc(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1), 3));
                            // Если категория равная "Вечериночные"
                        } else if (category.equals("party")) {
                            model.addAttribute("search_product1", productRepository.findByTitleAndCategoryOrderByPriceDesc(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1), 1));
                            // Если категория равная "Детекивные"
                        } else if (category.equals("detect")) {
                            model.addAttribute("search_product1", productRepository.findByTitleAndCategoryOrderByPriceDesc(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1), 2));
                        }
                        // Если категория не выбрана
                    }
                    else {
                        model.addAttribute("search_product1", productRepository.findByTitleOrderByPriceDesc(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1)));
                    }
                }
            }
            else {
                model.addAttribute("search_product1", productRepository.findByTitleAndPriceGreaterThanEqualAndPriceLessThan(search1.toLowerCase(), Float.parseFloat(ot1), Float.parseFloat(Do1)));
            }
        } else {
            model.addAttribute("search_product1",productRepository.findByTitleContaining(search1));
        }
        model.addAttribute("value_search1", search1);
        model.addAttribute("value_price_ot1", ot1);
        model.addAttribute("value_price_do1", Do1);
        model.addAttribute("products", productService.getAllProduct());
        return "/user/index";
    }
}
