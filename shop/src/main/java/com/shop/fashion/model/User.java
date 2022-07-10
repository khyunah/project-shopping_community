package com.shop.fashion.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userIdNumber;
	
	private String userId;
	
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = false)
	private String username;
	
	@Column(nullable = false)
	private String email;
	
	@Column(length = 11, nullable = false)
	private String phoneNumber;
	
	@Column(nullable = false)
	private String address;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "basket_id")
	private Basket basket;
	
	@Enumerated(value = EnumType.STRING)
	private RollType role;
	
	@Enumerated(value = EnumType.STRING)
	private OAuthType oauth;
	
	@CreationTimestamp
	private Timestamp createDate;
}
