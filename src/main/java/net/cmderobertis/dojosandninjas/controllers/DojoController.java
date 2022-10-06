package net.cmderobertis.dojosandninjas.controllers;
import net.cmderobertis.dojosandninjas.models.Dojo;
import net.cmderobertis.dojosandninjas.services.DojoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@Controller
public class DojoController {
    @Autowired
    DojoService service;
    @GetMapping("/")
    String index() {
        return "redirect:/dojos";
    }
    @GetMapping("/dojos/new")
    String createForm(@ModelAttribute("dojo") Dojo dojo) {
        return "createDojo.jsp";
    }
    @PostMapping("/dojos")
    String create(@ModelAttribute("dojo") Dojo dojo) {
        service.create(dojo);
        return "redirect:/dojos";
    }
    @GetMapping("/dojos")
    String showAll(Model model) {
        List<Dojo> dojos = service.getAll();
        model.addAttribute("dojos", dojos);
        return "dojos.jsp";
    }
    @GetMapping("/dojos/{id}")
    String showOne(@PathVariable Long id, Model model) {
        Dojo dojo = service.getOne(id);
        model.addAttribute("ninjas", dojo.getNinjas());
        return "showDojo.jsp";
    }
    @GetMapping("/dojos/{id}/edit")
    String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("dojo", service.getOne(id));
        return "updateDojo.jsp";
    }
    @PutMapping("/dojos/{id}")
    String update(
            @Valid
            @ModelAttribute("dojo") Dojo dojo,
            BindingResult result) {
        if (result.hasErrors()) {
            return "updateDojo.jsp";
        } else {
            service.update(dojo);
            return "redirect:/dojos";
        }
    }
    @DeleteMapping("/dojos/{id}")
    String delete(@PathVariable("id") Long id) {
        service.delete(id);
        return "redirect:/dojos";
    }
}
