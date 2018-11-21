package app.model;

import app.DTO.AuthorDTO;

import java.util.List;

public class Author implements java.io.Serializable{
    private Integer id;
    private String fullName;
    private String description;
    private List<Book> books;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public Author() {
    }

    public Author(AuthorDTO authorDTO) {
        this.id = authorDTO.getId();
        this.fullName = authorDTO.getFullName();
        this.description = authorDTO.getDescription();
    }
}
