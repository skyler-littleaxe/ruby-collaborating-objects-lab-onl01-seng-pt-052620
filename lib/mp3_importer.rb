class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    # Dir.children is a clever method in Ruby that returns an array containing
    # filenames of the directory passed into it.
    Dir.children("#{path}")
  end
  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end