package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import dbcontext.DBUtil;
import entity.Song;

public class SongDAO {
	public ArrayList<Song> allSong() {
		ArrayList<Song> list = new ArrayList<Song>();
		DBUtil db = DBUtil.getInstance();
		String sql = "Select * from songs";
		Connection con = null;
		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				list.add(new Song(rs.getString("songName"), rs.getString("artist"), rs.getString("link"),
						rs.getString("cover")));
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
		return list;
	}

	public ArrayList<Song> fav(String id) {
		ArrayList<Song> list = new ArrayList<Song>();
		DBUtil db = DBUtil.getInstance();
		String sql = "SELECT songName,artist,link,cover FROM users INNER JOIN favs\r\n"
				+ "ON users.userID = favs.userID\r\n" + "INNER JOIN songs\r\n"
				+ "ON favs.songID = songs.songID WHERE users.userID = '" + id + "'";
		Connection con = null;
		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				list.add(new Song(rs.getString("songName"), rs.getString("artist"), rs.getString("link"),
						rs.getString("cover")));
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
		return list;
	}

	public void addSong(String uid, String sname) {

		String sid = "";
		DBUtil db = DBUtil.getInstance();
		String sql2 = "select songID from songs where songName='" + sname + "'";
		Connection con = null;

		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql2);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				sid = rs.getString("songID");
			}
		} catch (Exception e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
		}

		String sql = "INSERT INTO favs VALUES(?,?)";
		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, Integer.parseInt(uid));
			statement.setInt(2, Integer.parseInt(sid));
			statement.execute();
		} catch (Exception e) {
			Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, e);
		} finally {
			try {
				DBUtil.closeConnection(con);
			} catch (SQLException e) {
				Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}

	public ArrayList<Song> searchSong(String sname) {
		ArrayList<Song> list = new ArrayList<Song>();
		String sid = "";

		DBUtil db = DBUtil.getInstance();
		String sql = "select * from songs where UPPER(songName) LIKE UPPER('%" + sname + "%')";

		Connection con = null;
		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				list.add(new Song(rs.getString("songName"), rs.getString("artist"), rs.getString("link"),
						rs.getString("cover")));
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
		return list;
	}

	public void delSong(String uid, String sname) {

		String sid = "";
		DBUtil db = DBUtil.getInstance();
		String sql2 = "select songID from songs where songName='" + sname + "'";

		Connection con = null;

		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql2);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				sid = rs.getString("songID");
			}
		} catch (Exception e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
		}

		String sql = "DELETE FROM favs WHERE userID=? AND songID=?";

		try {
			con = db.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, Integer.parseInt(uid));
			statement.setInt(2, Integer.parseInt(sid));
			statement.execute();
		} catch (Exception e) {
			Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, e);
		} finally {
			try {
				DBUtil.closeConnection(con);
			} catch (SQLException e) {
				Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}

}
