package test4.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import test4.work.entity.Category;
import test4.work.service.CategoryService;

@Controller
@RequestMapping("/admin/categories")
@RequiredArgsConstructor
public class CategoryController {

	private final CategoryService service;

	// =========================
	// DANH SÁCH + TÌM KIẾM
	// =========================

	@GetMapping
	public String index(@RequestParam(defaultValue = "") String keyword, Model model) {

		model.addAttribute("categories", service.search(keyword));

		model.addAttribute("keyword", keyword);

		return "admin/category/list";
	}

	// =========================
	// FORM THÊM
	// =========================

	@GetMapping("/add")
	public String add(Model model) {

		model.addAttribute("category", new Category());

		return "admin/category/form";
	}

	// =========================
	// FORM SỬA
	// =========================

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Integer id, Model model, RedirectAttributes ra) {

		Category category = service.findById(id);

		if (category == null) {

			ra.addFlashAttribute("error", "Không tìm thấy danh mục!");

			return "redirect:/admin/categories";
		}

		model.addAttribute("category", category);

		return "admin/category/form";
	}

	// =========================
	// LƯU
	// =========================

	@PostMapping("/save")
	public String save(@ModelAttribute Category category, RedirectAttributes ra) {

		service.save(category);

		ra.addFlashAttribute("success", "Lưu danh mục thành công!");

		return "redirect:/admin/categories";
	}

	// =========================
	// XÓA
	// =========================

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Integer id, RedirectAttributes ra) {

		service.delete(id);

		ra.addFlashAttribute("success", "Xóa danh mục thành công!");

		return "redirect:/admin/categories";
	}
}