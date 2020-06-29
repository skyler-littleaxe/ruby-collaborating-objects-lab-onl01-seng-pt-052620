  
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
    song.artist = self
  end

  def add_song_by_name(name)
    song = Song.new(name)
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

 def self.find_or_create_by_name(name)
   artist = @@all.find do |art|
     art.name == name
   end
   if artist 
     artist
   else
     new_artist = Artist.new(name)
   end
 end
end