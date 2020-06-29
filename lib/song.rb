class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end
  def self.new_by_filename(filename)
    # artist, title, genre = filename.chomp(".mp3").split(" - ")
    #
    # song = self.new(filename)
    # song.title
    artist = filename.chomp(".mp3").split(" - ")[0]
    title = filename.chomp(".mp3").split(" - ")[1]
    genre = filename.chomp(".mp3").split(" - ")[2]
    new_song = Song.new(title)
    new_song.artist_name=(artist)
    new_song
  end
  def title=(title)
    @title = title
  end
  def self.all
    @@all
  end
  def artist_name=(name)
    artist_name = Artist.find_or_create_by_name(name)
    self.artist = artist_name
    artist.add_song(self)
  end
end