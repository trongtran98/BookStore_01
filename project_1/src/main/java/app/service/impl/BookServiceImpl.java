package app.service.impl;


import app.bean.BookInfo;
import app.model.Book;
import app.service.BookService;
import app.utils.CloudinaryUtils;

import java.io.Serializable;
import java.util.*;

public class BookServiceImpl extends BaseServiceImpl implements BookService {
    @Override
    public List<BookInfo> loadBooksTypeNew(int number) {
        try {
            List<Book> bookModels = bookDAO.loadBooksTypeNew(number);
            return convertBookToBookInfo(bookModels);

        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override

    public List<BookInfo> findByName(String bookName, Integer page, Integer bookPerPage) {
        try {
            List<Book> bookModels = bookDAO.findByName(bookName, page, bookPerPage);
            return convertBookToBookInfo(bookModels);

        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    public List<BookInfo> findBooks() {
        try {
            List<Book> bookModels = bookDAO.findBooks();
            return convertBookToBookInfo(bookModels);

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
    public Map<String, Long> getByPrice() {
        try {
            float from = 0f;
            float to = 9.99f;
            Map<String, Long> map = new LinkedHashMap<>();
            for (int i = 0; i < 5; i++) {
                if (i < 4) {
                    map.put(String.format("%.2f", from) + " - " + String.format("%.2f", to)
                            , bookDAO.getByPriceRange(from, to) == null
                                    ? 0l : bookDAO.getByPriceRange(from, to));
                    from += 10f;
                    to += 10f;
                } else {
                    map.put(String.format("%.2f", from) + " - ~"
                            , bookDAO.getByPriceUp(from) == null
                                    ? 0l : bookDAO.getByPriceUp(from));
                }
            }
            return map;

        } catch (Exception e) {
            return Collections.emptyMap();
        }

    }

    @Override
    public List<BookInfo> getForPanel(int maxResult) {
        try {
            List<Book> panels = bookDAO.getForPanel(maxResult);
            if (panels == null)
                return Collections.emptyList();

            return convertBookToBookInfo(panels);

        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public List<BookInfo> getBestSaleOfTheDay(int maxResult) {
        try {
            List<Book> salesBest = bookDAO.getBestSaleOfTheDay(maxResult);
            if (salesBest != null && salesBest.size() == maxResult) {
                return convertBookToBookInfo(salesBest);

            } else {
                List<Book> random = bookDAO.getRandom(maxResult);
                if (random == null)
                    return Collections.emptyList();

                return convertBookToBookInfo(random);
            }
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    public List<BookInfo> getRandom(int maxResult) {
        try {
            List<Book> bookModels = bookDAO.getRandom(maxResult);
            return convertBookToBookInfo(bookModels);

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

    private List<BookInfo> convertBookToBookInfo(List<Book> books) {
        List<BookInfo> bookInfos = new ArrayList<>();
        for (Book book : books) {
            book.setAvatar(cloudinaryUtils.loadImageBook(book.getAvatar()));
            bookInfos.add(new BookInfo(book));
        }
        return bookInfos;
    }
}
