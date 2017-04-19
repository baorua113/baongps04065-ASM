/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author GiaBao
 */
@Entity
@Table(name = "Staffs")
public class Staff {

    @Id
    @NotBlank(message = "Không được để trống mã nhân viên !")
    private String id;

    @NotBlank(message = "Không được để trống họ và tên !")
    private String name;

    private Boolean gender;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull(message="Không được để trống ngày sinh !")
    private Date birthday;

    @NotNull(message="Vui lòng chọn hình ảnh !")
    private String photo;

    @NotBlank(message="Không được để trống email !")
    @Email(message = "Email phải đúng định dạng !")
    private String email;

    @NotBlank(message = "Không được để trống sđt !")
    @Length(message = "Số điện thoại không đúng (10-11) !")
    private String phone;

    @NotNull(message="Không được để trống lương !")
    private Double salary;

    private String notes;

    @ManyToOne
    @JoinColumn(name = "departId")
    private Depart depart;

    @OneToMany(mappedBy = "staff", fetch = FetchType.EAGER)
    private Collection<Record> records;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public Collection<Record> getRecords() {
        return records;
    }

    public void setRecords(Collection<Record> records) {
        this.records = records;
    }

}
