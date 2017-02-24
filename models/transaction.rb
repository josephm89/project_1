class Transaction 

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @description = options['description']
    @tag_id = options['tag_id']
  end

end