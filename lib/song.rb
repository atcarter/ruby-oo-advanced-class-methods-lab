class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    Song.all.find{|s|s.name == name}
  end

  def self.find_or_create_by_name(name)

    if find_by_name(name) == nil
      create_by_name(name)

    else
      find_by_name(name)
    end

  end

  def self.alphabetical
    Song.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(string)

    array = string.split(" - ")
    artist = array[0]
    name = array[1][0..-5]
    obj = self.new
    obj.name = name
    obj.artist_name = artist
    obj

  end

  def self.create_from_filename(string)
    array = string.split(" - ")
    artist = array[0]
    name = array[1][0..-5]
    obj = self.new
    obj.name = name
    obj.artist_name = artist
    @@all << obj

  end


  def self.destroy_all
    @@all = []
  end












end
