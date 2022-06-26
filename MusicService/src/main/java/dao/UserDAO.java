package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import dbcontext.DBUtil;

public class UserDAO {
	public boolean login(String username, String password) {
		DBUtil db = DBUtil.getInstance();
		String sql = "Select * from users";
		Connection con = null;
		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				if (rs.getString("username").equals(username) && rs.getString("password").equals(password)) {
					return true;
				}
			}
		} catch (Exception e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
		} finally {
			try {
				DBUtil.closeConnection(con);
			} catch (SQLException e) {
				Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
			}
		}
		return false;
	}

	public void updateUser(String fn, String em, String un, String pw) {
		String sql = "UPDATE users SET name=?,email=?,password=? WHERE username=?;";
		DBUtil db = DBUtil.getInstance();
		Connection con = null;
		PreparedStatement statement = null;
		try {
			con = db.getConnection();
			statement = con.prepareStatement(sql);
			statement.setString(1, fn);
			statement.setString(2, em);
			statement.setString(3, pw);
			statement.setString(4, un);
			statement.execute();
		} catch (Exception e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
		} finally {
			try {
				DBUtil.closeConnection(con);
			} catch (SQLException e) {
				Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}

	public void signUpUser(String fn, String em, String un, String pw) {
		DBUtil db = DBUtil.getInstance();
		String sql = "insert into users(name,email,username,password) values(?,?,?,?);";
		Connection con = null;
		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, fn);
			statement.setString(2, em);
			statement.setString(3, un);
			statement.setString(4, pw);
			statement.executeUpdate();
		} catch (Exception e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
		} finally {
			try {
				DBUtil.closeConnection(con);
			} catch (SQLException e) {
				Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}
}
