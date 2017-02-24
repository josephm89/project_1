require_relative'../db/sqlrunner'
class Transaction 
  
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @description = options['description']
    @tag_id = options['tag_id']
    @value = options['value'].to_i
  end

  def save
    sql = "INSERT INTO transactions (description, tag_id, value) VALUES ('#{@description}','#{@tag_id}',#{@value}) RETURNING *"
    @id = SqlRunner.run(sql).first['id']
  end

end