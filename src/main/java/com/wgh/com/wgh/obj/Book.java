package com.wgh.com.wgh.obj;

import java.io.Serializable;

public class Book implements Serializable {
    private Integer id ;
    private String title;
    private String author;
    private String Date;
    private Double price;
    private Integer amount;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Book() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Book(Integer id, String title, String author, String date, Double price, Integer amount) {
        this.id = id;
        this.title = title;
        this.author = author;
        Date = date;
        this.price = price;
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", Date='" + Date + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                '}';
    }
}
