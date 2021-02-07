require "pry"

class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
