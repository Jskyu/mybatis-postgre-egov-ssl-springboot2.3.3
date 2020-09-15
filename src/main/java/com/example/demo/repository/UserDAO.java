package com.example.demo.repository;

import com.example.demo.dto.UserDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @class UserDAO
 * 설명 : mapper 에서 입력한 쿼리문을 실행시키기 위한 Method 를 가진 class 이다.
 */
@Repository("UserDAO")
public interface UserDAO {
    List<UserDTO> selectUsersByCountry(String country) throws Exception;
    List<UserDTO> selectAll() throws Exception;
    int selectAllCount() throws Exception;

    UserDTO findByUsername(String username) throws Exception;
    UserDTO findById(Long id) throws Exception;

    void createUser(UserDTO dto) throws Exception;
    void updateUser(UserDTO dto) throws Exception;
    void removeUser(Long id) throws Exception;

    Long findUserEntityByLastResultId() throws Exception;
}
