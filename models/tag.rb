require_relative'../db/sqlrunner'
class Tag
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *"
    @id = SqlRunner.run(sql).first['id'].to_i
  end



end