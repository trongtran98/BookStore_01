package app.service.impl;


import app.bean.BookInfo;
import app.model.Book;
import app.service.BookService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BookServiceImpl extends BaseServiceImpl implements BookService {
    @Override
    public List<BookInfo> loadBooksTypeNew(int number) {
        try {
            List<Book> bookModels = bookDAO.loadBooksTypeNew(number);
            List<BookInfo> bookInfos = new ArrayList<>();
            for (Book book : bookModels) {
                bookInfos.add(new BookInfo(book));
            }
            return bookInfos;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override

    public List<BookInfo> findByName(String bookName, Integer page, Integer bookPerPage) {
        try {
            List<Book> bookModels = bookDAO.findByName(bookName, page, bookPerPage);
            List<BookInfo> bookInfos = new ArrayList<>();
            for (Book book : bookModels) {
                bookInfos.add(new BookInfo(book));
            }
            return bookInfos;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    public List<BookInfo> findBooks() {
        try {
            List<Book> bookModels = bookDAO.findBooks();
            List<BookInfo> bookInfos = new ArrayList<>();
            for (Book book : bookModels) {
                bookInfos.add(new BookInfo(book));
            }
            return bookInfos;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public Integer countByName(String bookName) {
        try {
            return bookDAO.countByName(bookName).intValue();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<BookInfo> getPanel(int maxResult) {
        try {
            List<Book> panels = bookDAO.getPanel(maxResult);
            if (panels == null) {
                return Collections.emptyList();
            }

            List<BookInfo> panelInfo = new ArrayList<>();
            for (Book book : panels) {
                panelInfo.add(new BookInfo(book));
            }

            return panelInfo;

        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public List<BookInfo> bestSaleOfTheDay(int maxResult) {
        try {
            List<Book> salesBest = bookDAO.bestSaleOfTheDay(maxResult);
            if (salesBest != null && salesBest.size() == maxResult) {
                List<BookInfo> salesBestInfo = new ArrayList<>();
                for (Book book : salesBest) {
                    salesBestInfo.add(new BookInfo(book));
                }
                return salesBestInfo;
            }

            List<Book> random = bookDAO.randomBooks(maxResult);
            if (random != null) {
                List<BookInfo> randomInfo = new ArrayList<>();
                for (Book book : random) {
                    randomInfo.add(new BookInfo(book));
                }
                return randomInfo;
            }
            return Collections.emptyList();

        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    public List<BookInfo> randomBooks(int maxResult) {
        try {
            List<Book> bookModels = bookDAO.randomBooks(maxResult);
            List<BookInfo> bookInfos = new ArrayList<>();
            for (Book book : bookModels) {
                bookInfos.add(new BookInfo(book));
            }
            return bookInfos;
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public Book findById(Serializable key) {
        try {
            return bookDAO.findById(key);
        } catch (Exception e) {
            return null;
        }
    }

    public Book findById(Integer key) {
        return bookDAO.findById(key);
    }

    @Override
    public Book saveOrUpdate(Book entity) {
        try {
            return bookDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer id) {
        try {
            Book book = bookDAO.findBookById(id, true);
            if (book == null)
                return false;

            bookDAO.delete(book);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }
}
