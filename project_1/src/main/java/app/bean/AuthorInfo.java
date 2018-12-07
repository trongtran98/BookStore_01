package app.bean;

import app.model.Author;

public class AuthorInfo {
    private Integer id;
    private String fullName;
    private String description;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public AuthorInfo() {
    }
    public AuthorInfo(Author author) {
        this.id = author.getId();
        this.fullName = author.getFullName();
        this.description = author.getDescription();
    }
}
