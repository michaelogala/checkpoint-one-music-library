class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize(path = './db/mp3s')
    @path = path
    @files = []
    import
  end

  def load_files
    if File.exist?(@path) && File.directory?(@path)
      Dir.foreach @path do |file|
        @files << file if file.include?('.mp3')
      end
    end
  end

  def import
    load_files
    @files.each { |file| Song.new_from_filename(file) }
  end
end
