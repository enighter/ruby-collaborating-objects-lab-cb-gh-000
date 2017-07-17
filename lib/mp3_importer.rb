class MP3Importer

  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    files = Dir.entries(path)
    mp3_files = []
    files.each do |file|
      mp3_files << file if file.match(/\.mp3$/)
    end
    mp3_files
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
