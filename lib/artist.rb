class Artist

  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    self.name = name
    self.songs = []
    self.save
  end

  def self.create_by_name(name)
    self.new(name)
  end

  def self.find_or_create_by_name(name)
    existing_artist = self.all.find do |artist|
      artist.name == name
    end
    existing_artist ? existing_artist : self.create_by_name(name)
  end

  def add_song(song)
    self.songs << song
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
