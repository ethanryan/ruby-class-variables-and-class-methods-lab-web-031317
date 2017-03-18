require 'pry'

class Song

  @@count = 0 #double @@ makes this a class variable, this counter is set to 0
  @@artists = []
  @@genres = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist, genre)
    #binding.pry
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@artists << artist
    @@genres << genre
  end

  def new(name, artist, genre)
    song = Song.new(name, artist, genre)
  end

  #a class method that returns the total number of songs
  def self.count #self before count makes this a class method
    @@count
  end

  def self.artists #self before artists makes this a class method
    @@artists.uniq
  end

  def self.genres #self before genres makes this a class method
    @@genres.uniq
  end

  #a class method that returns a hash of genres
  #and the number of songs that have those genres

  # @@genres.each_with_object({}) do |genres, hash|
  #   binding.pry
  #   #hash[genres[:genre]] = genres
  # end #end loop

  def self.genre_count #self before genres makes this a class method
    new_hash = {}
    @count = 1

    @@genres.each do |each_genre|
      if new_hash[each_genre] #if new_hash[each_genre] exists, meaning it has a value of at least 1...
        new_hash[each_genre] = @count #add 1 more to its count
      elsif new_hash[each_genre] == nil #if new_hash[each_genre] returns nil, meaning it has no value...
        new_hash[each_genre] = 1 #set its value to 1
      end #end if else
      @count += 1
    end #end loop
    new_hash
  end #end method


  def self.artist_count #self before genres makes this a class method
    new_hash = {}
    @count = 1

    @@artists.each do |each_genre|
      if new_hash[each_genre] #if new_hash[each_genre] exists, meaning it has a value of at least 1...
        new_hash[each_genre] = @count #add 1 more to its count
      elsif new_hash[each_genre] == nil #if new_hash[each_genre] returns nil, meaning it has no value...
        new_hash[each_genre] = 1 #set its value to 1
      end #end if else
      @count += 1
    end #end loop
    new_hash
  end #end method

end #end class
