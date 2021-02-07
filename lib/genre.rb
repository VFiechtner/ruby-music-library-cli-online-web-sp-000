class Genre
  #extend Concerns::Findable
  #extend Memorable::ClassMethods
  #include Memorable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(genre)
   self.new(genre)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
