class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # instantiate and save song, and returns the new song that was created
  def self.create
    song = self.new
    song.save
    song
  end

  # instantiate a song with a name property
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  #instantiate and save a song with a name property
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  # find a song present in @@all by name
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
    # return the existing Song object when provided the title of an existing song
    # create a new Song object with the provided title if one doesn't have one
  end

  #invokes .find_by_name and .create_by_name instead of repeating code
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  # return all the song instances in alphabetical ordere by song name
  def self.alphabetical
    self.all.sort_by {|song_name| song_name.name}
  end

  # initialize a song and artist name based on the filename format
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # initialize and save a song and artist name based on the filename format
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
