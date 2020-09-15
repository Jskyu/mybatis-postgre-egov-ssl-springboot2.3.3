package com.example.demo.service;

import com.example.demo.dto.UserDTO;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @interface UserService
 * @extends UserDetailsService
 * 설명 : UserDAO 에서 구현한 메서드를 사용하는 Service Interface
 */
public interface UserService extends UserDetailsService {

    /**
     * @Method getGenerateValueId
     * @return Long
     * @throws Exception
     * 설명 : UserDAO 에서 현재 존재하는 id 값중 가장 높은값을 가져와 +1을 해준 다음 반환해주는 Method 이다 만약 id 값이
     *       존재하지 않는다면 1을 반환한다.
     * 목적 : id 값을 1부터 1씩 증가하는 값으로 설정하기 위한 Method 이다.
     */
    Long getGenerateValueId() throws Exception;

    /**
     * @Method selectUsersByCountry
     * @param country
     * @return List<UserDTO>
     * @throws Exception
     * 설명 : UserDAO.selectUserByCountry 에 country 값을 전달하여 받은 값을 다시 메서드를 호출한 지점으로 반환해준다.
     * 목적 : country 가 일치하는 정보들을 불러오기 위한 Method 이다.
     */
    List<UserDTO> selectUsersByCountry(String country) throws Exception;

    /**
     * @Method selectAll
     * @return List<UserDTO>
     * @throws Exception
     * 설명 : UserDAO.selectAll 을 호출하여 받은 값을 다시 메서드를 호출한 지점으로 반환해준다.
     * 목적 : 모든 유저의 정보를 가져오기 위한 Method 이다.
     */
    List<UserDTO> selectAll() throws Exception;

    /**
     * @Method selectAllCount
     * @return int
     * @throws Exception
     * 설명 : UserDAO.selectAllCount 를 호출하여 받은 값을 다시 메서드를 호출한 지점으로 반환해준다.
     * 목적 : 모든 유저의 정보 갯수를 가져오기 위한 Method 이다.
     */
    int selectAllCount() throws Exception;

    /**
     * @Method findByUsername
     * @param username
     * @return UserDTO
     * @throws Exception
     * 설명 : UserDAO.findByUsername 을 호출하여 받은 값을 다시 메서드를 호출한 지점으로 반환해준다.
     * 목적 : 입력한 값과 이름이 일치하는 유저의 정보를 가져오기 위한 Method 이다.
     */
    UserDTO findByUsername(String username) throws Exception;

    /**
     * @Method findById
     * @param id
     * @return UserDTO
     * @throws Exception
     * 설명 : UserDAO.findById 를 호출하여 받은 값을 다시 메서드를 호출한 지점으로 반환해준다.
     * 목적 : 입력한 값과 ID 가 일치하는 유저의 정보를 가져오기 위한 Method 이다.
     */
    UserDTO findById(Long id) throws Exception;

    /**
     * @Method createUser
     * @param userEntity
     * @return Long
     * @throws Exception
     * 설명 : 받아온 값의 username 과 기존 데이터에 있던 username 이 일치하는 것이 있는지 확인 한 후, 만약 일치하는 것이 있다면
     *        duplicateValidateException 을 터뜨리고, 일치하는 username 이 없다면
     *        password encoding 을 해준 후 DataBase 에 저장하고, 메서드를 호출한 지점에 저장된 정보의 ID 값을 반환한다.
     * 목적 : 새로운 유저의 정보를 만들기 위한 Method 이다.
     */
    Long createUser(UserDTO userEntity) throws Exception;

    /**
     * @Method updateUser
     * @param userEntity
     * @throws Exception
     * 설명 : UserDAO.updateUser 를 User 의 정보를 담아 호출한다.
     * 목적 : 유저의 정보를 업데이트 하기 위한 Method 이다.
     */
    void updateUser(UserDTO userEntity) throws Exception;

    /**
     * @Method removeUser
     * @param id
     * @throws Exception
     * 설명 : UserDAO.removeUser 를 User 의 정보를 담아 호출한다.
     * 목적 : 유저의 정보를 삭제하기 위한 Method 이다.
     */
    void removeUser(Long id) throws Exception;
}
