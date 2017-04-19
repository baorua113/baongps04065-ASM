/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.entity;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author GiaBao
 */
public class UserModel {

    @NotBlank(message = "Không được để trống tên đăng nhập !")
    private String username;

    @Length(min = 6, max = 30, message = "Mật khẩu phải từ 6 kí tự trở lên !")
    @NotNull(message = "Không được để trống mật khẩu !")
    private String password;

    @NotBlank(message = "Không được để trống họ tên !")
    private String fullname;

    public UserModel() {
    }

    public UserModel(String username, String password, String fullname) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

}
