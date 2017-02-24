require_relative'../db/sqlrunner'
class Tag
  attr_reader :id, :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *"
    @id = SqlRunner.run(sql).first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags;"
    SqlRunner.run(sql).map{|x| Tag.new(x)}
  end

  def delete
    sql = "DELETE FROM tags WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

end