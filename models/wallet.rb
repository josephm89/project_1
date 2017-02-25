class Wallet
  attr_accessor :budget

  def initialize(options)
    @budget = options['budget'].to_i
    #@id = options['id'].to_i if options['id']
  end

  def self.show_current_money
    sql ="SELECT * FROM wallet WHERE id = 1"
    wallet = SqlRunner.run(sql).first
    result = wallet['budget'].to_i
  end

  def self.show_full_money
    sql ="SELECT * FROM wallet WHERE id = 2"
    wallet = SqlRunner.run(sql).first
    result = wallet['budget'].to_i
  end

  def self.find_current
    sql = "SELECT * FROM wallet WHERE id = 1"
    wallet = SqlRunner.run(sql).first
    return Wallet.new(wallet)
  end

  def self.find_full
    sql = "SELECT * FROM wallet WHERE id = 2"
    wallet = SqlRunner.run(sql).first
    return Wallet.new(wallet)
  end

  def update_current
    sql = "UPDATE wallet SET budget = #{@budget} WHERE id = 1"
    SqlRunner.run(sql)
  end

  def update_full
    sql = "UPDATE wallet SET budget = #{@budget} WHERE id = 2"
    SqlRunner.run(sql)
  end

end












  # def save
  #   sql = "INSERT INTO wallet (budget, id) VALUES (#{@budget},#{@id})"
  #   SqlRunner.run(sql)
  # end
