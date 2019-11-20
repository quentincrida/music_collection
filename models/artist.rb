class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i

  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def band_names()
    sql = "SELECT * FROM artists WHERE name = $1;"
    values = [@name]
    band_names = SqlRunner.run(sql,values)
    map{|band_name| Artist.new(band_name)}

  end

end
