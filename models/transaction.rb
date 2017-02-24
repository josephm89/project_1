require_relative'../db/sqlrunner'
class Transaction 
  attr_accessor :tag_id
  attr_reader :description, :value, :id
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

  def self.all
    sql = "SELECT * FROM transactions;"
    SqlRunner.run(sql).map{|x| Transaction.new(x)}
  end

  def tag
    sql = "SELECT * FROM tags WHERE #{@tag_id} = tags.id"
    result = SqlRunner.run(sql)
    tag = Tag.new( result.first )
    return tag.name 
  end

  def tag_class_return
    sql = "SELECT * FROM tags WHERE #{@tag_id} = tags.id"
    result = SqlRunner.run(sql)
    tag = Tag.new( result.first ) 
  end




  def delete
    sql = "DELETE FROM transactions WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

end