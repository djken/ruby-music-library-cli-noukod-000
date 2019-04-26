class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre


  def initialize(name, artist = nil ,genre = ni)
    @name = name
    self.artist = (artist) if artist
    self.genre = (genre) if genre
  end

  # This is a class method that returns all instances of Song class
  def self.all # Class reader
    @@all
  end

  # Reset the state of the @@ll class to an empty array  thereby deleting all previous song instances.
  def self.destroy_all
    all.clear
  end

  # Save all created instances of Song class in @@all class variable
  def save
    Song.all << self
  end

  # This is a class method that create and stores instances.
  def self.create(name)
    new(name).tap do |song|
      song.save
    end
  end

  # Setter method for the artist method.
  # Return the song by calling the methog add_song.
  def artist=(artist)
    @artist = artist
    artist.add_song self
  end

  # Setter method for the genre method.

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end


  def self.find_by_name(name)
     all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name name or create name
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre = filename.gsub(".mp3","").split(" - ")
    new(song_name,Artist.find_or_create_by_name(artist_name),Genre.find_or_create_by_name(genre))
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap {|song| song.save}
  end
end
