class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
   @name = name
   @@all << self
  end
  def self.all
   @@all
  end
  def add_song(song)
   song.artist = self # setter
  end
  # def add_song_by_name(name)
  #  song = Song.new(name) # getter
  #  song.artist = self
  # end
  def self.find_or_create_by_name(name)
    artist = @@all.find do |art|
      art.name == name
    end
    if artist == nil
      Artist.new(name)
    else
      return artist
    end
  end
  def songs
   Song.all.select {|song| song.artist == self}
  end
  def print_songs
    songs.each { |song| puts song.name }
  end
end