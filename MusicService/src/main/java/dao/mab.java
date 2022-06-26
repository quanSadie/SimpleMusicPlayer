package dao;

import java.util.ArrayList;

import entity.Song;

public class mab {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SongDAO dao = new SongDAO();
		ArrayList<Song> list = new ArrayList<Song>();

		list = dao.searchSong("Liquid time");
		System.out.println(list);
	}

}
