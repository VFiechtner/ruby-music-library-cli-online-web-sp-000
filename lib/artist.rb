require "pry"

class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
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
   new_artist = self.new(name)
   new_artist.save
   new_artist
  end
  
  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
