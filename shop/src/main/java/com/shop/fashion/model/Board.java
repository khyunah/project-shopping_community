package com.shop.fashion.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

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
public class Board {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;
    
    @Column(nullable = false)
    private String title;
  
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
    private List<Reply> replies = new ArrayList<Reply>();
    
    @Column(nullable = false)
    private int reaction;
   
    @OneToMany(mappedBy = "board")
    private List<Image> image = new ArrayList<Image>();
   
    @Column(nullable = false)
    private int replyCount;
   
    @Column(nullable = false)
    private String itemLink;

    @CreationTimestamp
    private Timestamp createDate;
}
