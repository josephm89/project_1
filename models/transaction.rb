class Transaction 

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @description = options['description']
    @tag_id = options['tag_id']
    @value = options['value'].to_i
  end

end