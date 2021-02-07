require "pry"

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name

    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
   @@all.clear
  end

  def save
   @@all << self
  end

  def self.create(name)
   created_song = self.new(name)
   created_song.save
   created_song
  end

  def self.new_from_filename(file_name)
    song = split_filename(file_name)
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2])

    new_song = self.new(song[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    song = split_filename(file_name)
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2])

    self.create(song[1]).tap do |song|
      song.artist = artist
      song.genre = genre
    end
  end

end
