package com.example.demo.controller;

import com.example.demo.dto.UserDTO;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Objects;

@RestController //Controller + ResponseBody
@RequiredArgsConstructor
@MapperScan(basePackages = "com.example.demo.repository")//탐색할 패키시 설정
public class UserController {

    //UserService 객체 userService 의존성 주입
    private final UserService userService;

    // 모든 유저의 정보 조회
    @GetMapping("/selectAll")
    public List<UserDTO> selectAll() throws Exception{
        return userService.selectAll();
    }

    // 입력받은 country 값과 일치하는 country 를 가지고 있는 유저의 정보를 조회
    @GetMapping("/findByUsersCountry")
    public List<UserDTO> selectUsersByCountry(@RequestParam("country") String country) throws Exception{
        return userService.selectUsersByCountry(country);
    }

    // 전체 유저정보의 갯수를 조회
    @RequestMapping("/selectAllCount")
    public int selectAllCount() throws Exception{
        return userService.selectAllCount();
    }

    // 입력받은 username 값과 일치하는 유저의 정보를 조회
    @GetMapping("/findByName")
    public UserDTO findByName(@RequestParam("name") String username) throws Exception{
        return userService.findByUsername(username);
    }

    // 입력받은 id 값과 일치하는 유저의 정보를 조회
    @GetMapping("/findUserById")
    public UserDTO findById(@RequestParam("id") Long id) throws Exception{
        return userService.findById(id);
    }

    // 유저 정보 생성
    @GetMapping("/createUser")
    public UserDTO createUser(@RequestParam("id") Long id,
                              @RequestParam("name") String username,
                              @RequestParam("password") String password,
                              @RequestParam("country") String country) throws Exception{
        UserDTO dto = new UserDTO(id, username, password, country);
        userService.createUser(dto);
        return dto;
    }

    // 유저 정보 업데이트
    @GetMapping("/updateUser")
    public UserDTO updateUser(@RequestParam("id") Long id,
                              @RequestParam("name") String username,
                              @RequestParam("country") String country) throws Exception{
        UserDTO findUser = userService.findById(id);
        findUser.setUsername(username);
        findUser.setCountry(country);
        userService.updateUser(findUser);

        return findUser;
    }

    // 유저 정보 삭제
    @GetMapping("/deleteUser")
    public String remove(@RequestParam("id") Long id) throws Exception{
        String name = Objects.requireNonNull(userService.findById(id)).getUsername();
        userService.removeUser(id);
        String isDelete;
        if(true){
            isDelete = " delete COMPLETE";
        }
        else{
            isDelete = " delete Fail";
        }
        return name + isDelete;
    }
}