package com.example.demo.service;

import com.example.demo.dto.UserDTO;
import com.example.demo.exception.DuplicateValidateException;
import com.example.demo.repository.UserDAO;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @class UserServiceImpl
 * @implements UserService
 * 설명 : UserService 의 구현 클래스
 * **메소드 설명은 UserService 참조**
 */
@Service("UserService")
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserDAO dao;
    private Long generateValueId;

    @Override
    public Long getGenerateValueId() throws Exception{
        // ID값을 받아오지 않은 상태일때 값을 받아온다.
        if(dao.findUserEntityByLastResultId() == null){
            generateValueId = 0L;
        }
        if(generateValueId == null){
            generateValueId = dao.findUserEntityByLastResultId();
        }
        // ID값을 1 증가시켜 반환
        return ++generateValueId;
    }

    @Override
    public List<UserDTO> selectUsersByCountry(String country) throws Exception{
        return dao.selectUsersByCountry(country);
    }

    @Override
    public List<UserDTO> selectAll() throws Exception{
        return dao.selectAll();
    }

    @Override
    public int selectAllCount() throws Exception{
        return dao.selectAllCount();
    }

    @Override
    public UserDTO findByUsername(String username) throws Exception{
        return dao.findByUsername(username);
    }

    @Override
    public UserDTO findById(Long id) throws Exception{
        return dao.findById(id);
    }

    @Override
    public Long createUser(UserDTO dto) throws Exception{
        duplicateValidateUser(dao.findByUsername(dto.getUsername()));
        dto.setId(getGenerateValueId());
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        dto.setPassword(passwordEncoder.encode(dto.getPassword()));
        dao.createUser(dto);
        return getGenerateValueId();
    }

    private void duplicateValidateUser(UserDTO findUser){
        if(findUser != null){
            throw new DuplicateValidateException("이미 존재하는 이름");
        }
    }

    @Override
    public void updateUser(UserDTO dto) throws Exception{
        dao.updateUser(dto);
    }

    @Override
    public void removeUser(Long id) throws Exception{
        dao.removeUser(id);
    }

    /**
     * @Method loadUserByUsername
     * @param username
     * @return
     * @throws UsernameNotFoundException
     * 설명 : UserDAO.findByUsername 을 호출하여 유저의 정보를 찾아 UserDetails 타입으로 반환해준다.
     *       단, 유저의 정보가 없을시 UsernameNotFoundException 을 터뜨린다.
     * 목적 : Security 를 적용시킨 유저의 정보를 찾기 위한 Method 이다.
     */
    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        UserDTO findUser = dao.findByUsername(username);

        if(findUser == null){
            throw new UsernameNotFoundException("User Not Found");
        }
        return findUser;
    }

}
