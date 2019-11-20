require_relative('../db/sql.runner')
require_relative('artist')

class Album

attr_accessor :title, :genre
attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING  id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.album_list()
    sql = "SELECT title FROM albums"
    #values = [@title]
    SqlRunner.run(sql)
  end

  def musicians()
    sql = "SELECT * FROM albums WHERE artist = $1"
    values = [@name]
    musicians = SqlRunner.new(sql,values)[1]
    return musicians.map {|musician| Artist.new(musician)}
  end

  def cd_names()
    sql = "SELECT * FROM albums WHERE artist_id = $3";
    values = [@id]
    cd_names = SqlRunner.run(sql, values)[0]
    return cd_names.map {|cd_name| Artist.new(cd_name)}
  end

end
