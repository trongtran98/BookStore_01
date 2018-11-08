package app.dao.impl;

import app.dao.BookDAO;
import app.dao.GenericDAO;
import app.model.Book;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

public class BookDAOImpl extends GenericDAO<Integer, Book> implements BookDAO {
	private static final Logger logger = Logger.getLogger(BookDAOImpl.class);

	public BookDAOImpl() {
		super(Book.class);
	}

	public BookDAOImpl(SessionFactory sessionfactory) {
		setSessionFactory(sessionfactory);
	}

//	@Override
//	public Book findByEmail(String email) {
//		logger.info("email: " + email);
//		return (Book) getSession().createQuery("FROM Student where email = ?").setParameter(0, email)
//				.getSingleResult();
//	}
//
//	@Override
//	public List<Student> searchStudentUsingCretial(String name, int gender) {
//		CriteriaBuilder builder = getSession().getCriteriaBuilder();
//		CriteriaQuery<Student> cr = builder.createQuery(Student.class);
//		Root<Student> root = cr.from(Student.class);
//		cr.select(root);
//
//		Predicate nameRestriction = builder.and(builder.like(root.get("name"), "%" + name + "%"));
//		Predicate genderRestriction = builder.and(builder.equal(root.get("gender"), gender));
//
//		cr.where(nameRestriction, genderRestriction);
//		return getSession().createQuery(cr).getResultList();
//	}
//
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Student> loadStudents() {
//		return getSession().createQuery("from Student").getResultList();
//	}

}
