package com.example.demo.dto;

import com.example.demo.role.UserRole;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotEmpty;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Getter // Getter 생성
@Setter // Setter 생성
public class UserDTO implements UserDetails {

    private Long id;

    @NotEmpty(message = "이 입력란을 작성해주세요") //Validate 검사
    private String username;
    @NotEmpty(message = "이 입력란을 작성해주세요")
    private String password;
    @NotEmpty(message = "이 입력란을 작성해주세요")
    private String confirmPassword;
    private String country;
//    private List<UserRole> role;

    public UserDTO(){}

    public UserDTO(Long id, String username, String password, String country){
        this.id = id;
        this.username = username;
        this.password = password;
        this.country = country;
    }

    /**
     * @Method getAuthorities
     * @return Collection<? extends GrantedAuthority>
     * 설명 : 유저 정보의 권환을 조회하기 위한 Method 이다.
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities(){
        List<SimpleGrantedAuthority> auth = new ArrayList<>();

//        for(UserRole userRole : role){
//            auth.add(new SimpleGrantedAuthority(userRole.getValue()));
//        }
        if(username.equals("admin")){
            auth.add(new SimpleGrantedAuthority(UserRole.ADMIN.getValue()));
        }
        else auth.add(new SimpleGrantedAuthority(UserRole.MEMBER.getValue()));

        return auth;
    }

    /* UserDetails 설정 */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
    /* UserDetails 설정 */
}
