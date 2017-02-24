class Wallet
  attr_accessor :budget, :id

  def initialize(options)
    @budget = options['budget'].to_i
    @id = 1
  end

  def save
    sql = "INSERT INTO wallet (budget, id) VALUES (#{@budget},#{@id})"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE wallet SET budget = #{@budget} WHERE id = 1"
    SqlRunner.run(sql)
  end

  def self.show
    sql ="SELECT * FROM wallet"
    wallet = SqlRunner.run(sql).first
    result = wallet['budget'].to_i
  end

end

