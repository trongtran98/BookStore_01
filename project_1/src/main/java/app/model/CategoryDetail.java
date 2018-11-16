package app.model;

import java.io.Serializable;
import java.util.List;

public class CategoryDetail{
    private Integer id;
    private String categoryDetailName;
    private Category category;
    private List<Book> books;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryDetailName() {
        return categoryDetailName;
    }

    public void setCategoryDetailName(String categoryDetailName) {
        this.categoryDetailName = categoryDetailName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }
}
