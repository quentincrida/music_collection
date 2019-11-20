require_relative('../db/sql.runner')

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

  def

  end

  end

end
