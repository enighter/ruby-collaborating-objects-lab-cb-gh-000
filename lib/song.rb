class Song
  attr_accessor :name, :artist, :genre

  def initialize(name)
    self.name = name
  end

  def self.new_by_filename(filename)
    filename_array = filename.split(" - ")
    artist = filename_array[0]
    name = filename_array[1]
    genre = filename_array[2].split(".")[0]
    song = self.new(name)
    song.genre = genre
    song.artist_name = artist
    song.artist.add_song(self)
    song
  end

  def artist_name=(name)
   if (self.artist.nil?)
     self.artist = Artist.find_or_create_by_name(name)
   else
     self.artist.name = name
   end
 end

end
