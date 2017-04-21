package com.yiibai.springmvc;

public class Student {
	   private Integer age;
	   private String name;
	   private Integer id;
	   private String sex;
	   private String password;
	   private String address;
	   private boolean receivePaper;
	   private String country;

	   public void setAge(Integer age) {
	      this.age = age;
	   }
	   public Integer getAge() {
	      return age;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }
	   public String getName() {
	      return name;
	   }

	   public void setId(Integer id) {
	      this.id = id;
	   }
	   public Integer getId() {
	      return id;
	   }
	   
	   public void setSex(String sex) {
		   this.sex = sex;
	   }
	   public String getSex() {
		   return sex;
	   }
	   
	   public void setPassword(String password) { 
	   	   this.password = password;
	   }
	   public String getPassword() {
		   return password;
	   }
	   
	   public void setAddress(String address) {
		   this.address = address;
	   }
	   public String getAddress() {
		   return address;
	   }
	   
	   public boolean isReceivePaper() {
		   return receivePaper;
	   }
	   public void setReceivePaper(boolean receivePaper) {
		   this.receivePaper = receivePaper;
	   }
	   
	   public String getCountry() {
		   return country;
	   }
	   public void setCountry(String country) {
		   this.country = country;
	   }
}
