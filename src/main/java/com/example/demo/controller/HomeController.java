package com.example.demo.controller;

import com.example.demo.dto.UserDTO;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final UserService userService;

    //index view
    @GetMapping("/")
    public String index(){
        return "index";
    }

    //login view
    @GetMapping("/login")
    public String loginForm(){
        return "users/login";
    }

    //login result view
    @GetMapping("/login/result")
    public String loginSuccess(){
        String loginResult = "users/login";
        if(true)
            loginResult += "Success";
        else
            loginResult += "Fail";
        return loginResult;
    }

    // denied view
    @GetMapping("/denied")
    public String denied(){
        return "denied";
    }

    //logout result view
    @GetMapping("/logout/result")
    public String logout(){
        String logoutResult = "users/logout";
        if(true)
            logoutResult += "Success";
        else
            logoutResult += "Fail";
        return logoutResult;
    }

    //signup view
    @GetMapping("/signup")
    public String form(Model model){
        model.addAttribute("userDTO", new UserDTO());
        return "users/signup";
    }

    //signup result view
    @PostMapping("/signup")
    public String createUser(@Valid UserDTO dto, BindingResult result, Model model) throws Exception{
        if(!dto.getPassword().equals(dto.getConfirmPassword())){
            System.out.println("회원 비밀번호 다시 확인");
            model.addAttribute("userDTO", dto);
            return "users/signup";
        }
        if(result.hasErrors()){
            return "users/signup";
        }
        userService.createUser(dto);

        return "redirect:/";
    }

    // user information view
    @GetMapping("/userInfo")
    public String userInfo(){
        return "users/userinfo";
    }

}