package myPack;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

import org.apache.naming.java.javaURLContextFactory;

import java.util.*;

public class BookDB {

	private String url = "jdbc:mysql://localhost:3306/BOOKDB";
	private String user = "root";
	private String password = "123456";

	public BookDB() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
	}

	public Connection getConnection() throws Exception {
		Connection con = java.sql.DriverManager.getConnection(url);
		return con;
	}

	public void closeConnection(Connection con) throws SQLException {
		con.close();
	}

	public void closePrepStmt(PreparedStatement ps) throws SQLException {
		ps.close();
	}

	public void closeResSet(ResultSet res) throws SQLException {
		res.close();
	}

	/* 获取每一本书的数量 */
	public int getNumberOfBooks() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from BOOKS";
			ps = con.prepareStatement(sql);
			res = ps.executeQuery();
			if (res.next()) {
				count = res.getInt(1);
			}
		} finally {
			closeConnection(con);
			closePrepStmt(ps);
			closeResSet(res);
		}
		return count;
	}

	/* 获取所有书的集合 */
	public Collection getBooks() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		ArrayList books = new ArrayList();
		try {
			con = getConnection();
			String sql = "select * from BOOKS";
			ps = con.prepareStatement(sql);
			res = ps.executeQuery();
			while (res.next()) {
				BookDetails bd = new BookDetails(res.getString(1),
						res.getString(2), res.getString(3), res.getFloat(4),
						res.getInt(5), res.getString(6), res.getInt(7));
				books.add(bd);
			}
		} finally {
			closeConnection(con);
			closePrepStmt(ps);
			closeResSet(res);
		}
		return books;
	}

	// 根据图书的ID获取图书的信息
	public BookDetails getBookDetails(String id) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		BookDetails bd = null;
		try {
			con = getConnection();
			String sql = "select * from BOOKS where ID=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			res = ps.executeQuery();
			if (res.next()) {
				bd = new BookDetails(res.getString(1), res.getString(2),
						res.getString(3), res.getFloat(4), res.getInt(5),
						res.getString(6), res.getInt(7));
				return bd;
			} else {
				return null;
			}
		} finally {
			closeConnection(con);
			closePrepStmt(ps);
			closeResSet(res);
		}

	}

	public void buyBooks(ShoppingCart cart) throws Exception {
		Connection con = null;
		Collection items = cart.getItems();
		Iterator it = items.iterator();
		try {
			con = getConnection();
			con.setAutoCommit(false);             //不自动提交事务
			while (it.hasNext()) {
				ShoppingCartItem sci = (ShoppingCartItem) it.next();
				BookDetails bd = (BookDetails) sci.getItem();
				String id = bd.getBookId();
				int quantity = sci.getQuantity();
				buyBook(id, quantity, con);
			}
			con.commit();               //提交事务
			con.setAutoCommit(true);          //自动提交事务
		} catch (Exception e) {
			con.rollback();                 //事务回滚
			throw e;
		} finally {
			closeConnection(con);
		}
	}

	public void buyBook(String id, int quantity, Connection con)
			throws Exception {
		PreparedStatement ps = null;
		ResultSet res = null;
		try {
			String sql = "select * from BOOKS where ID=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			res = ps.executeQuery();
			if (res.next()) {
				ps.close();
				String updateStatement = "update BOOKS set SALE_AMOUNT=SALE_AMOUNT+?  where ID=?";
				ps = con.prepareStatement(updateStatement);
				ps.setInt(1, quantity);
				ps.setString(2, id);
				ps.executeUpdate();
				ps.close();
			}
		} finally {
			closePrepStmt(ps);
			closeResSet(res);
		}

	}

}
