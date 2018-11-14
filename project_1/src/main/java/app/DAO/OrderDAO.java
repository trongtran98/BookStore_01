package app.DAO;

import app.model.Order;

import java.math.BigDecimal;
import java.util.TreeMap;

public interface OrderDAO extends BaseDAO<Integer, Order> {
    Long totalOrder();
    Long ordersOfTheMonth(int day);
    Long ordersOfTheYear(int month);
    Long ordersOfTheYears(int year);
}
