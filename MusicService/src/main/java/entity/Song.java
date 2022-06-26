package entity;

public class Song {
	private String songName;
	private String artist;
	private String link;
	private String cover;

	public Song() {

	}

	public Song(String songName, String artist, String link, String cover) {
		this.songName = songName;
		this.artist = artist;
		this.link = link;
		this.cover = cover;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	@Override
	public String toString() {
		return songName + artist + link + cover;
	}
}
