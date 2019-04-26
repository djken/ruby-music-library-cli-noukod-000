class Genre
  @@all = []
  attr_accessor :name, :songs
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    Genre.all << self
  end

  def self.create(name)
    new(name).tap do |genre| 
      genre.save
    end
  end

  def artists
    songs.collect do |song| 
      song.artist.uniq
    end
  end

end
