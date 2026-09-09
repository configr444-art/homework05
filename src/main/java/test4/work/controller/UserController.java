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
import test4.work.entity.User;
import test4.work.service.UserService;

@Controller
@RequestMapping("/admin/users")
@RequiredArgsConstructor
public class UserController {

	private final UserService service;

	// =========================
	// DANH SÁCH + TÌM KIẾM
	// =========================

	@GetMapping
	public String index(@RequestParam(defaultValue = "") String keyword, Model model) {

		model.addAttribute("users", service.search(keyword));

		model.addAttribute("keyword", keyword);

		return "admin/user/list";
	}

	// =========================
	// THÊM
	// =========================

	@GetMapping("/add")
	public String add(Model model) {

		model.addAttribute("user", new User());

		return "admin/user/form";
	}

	// =========================
	// SỬA
	// =========================

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Integer id, Model model, RedirectAttributes ra) {

		User user = service.findById(id);

		if (user == null) {

			ra.addFlashAttribute("error", "Không tìm thấy user!");

			return "redirect:/admin/users";
		}

		model.addAttribute("user", user);

		return "admin/user/form";
	}

	// =========================
	// LƯU
	// =========================

	@PostMapping("/save")
	public String save(@ModelAttribute User user, RedirectAttributes ra) {

		service.save(user);

		ra.addFlashAttribute("success", "Lưu user thành công!");

		return "redirect:/admin/users";
	}

	// =========================
	// XÓA
	// =========================

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Integer id, RedirectAttributes ra) {

		service.delete(id);

		ra.addFlashAttribute("success", "Xóa user thành công!");

		return "redirect:/admin/users";
	}
}