require('pg')

class Property

  attr_accessor :address, :value, :square_footage, :buy_let_status
  attr_reader :id

  def initialize(options)
    @address = options['address']
    @value = options['value']
    @square_footage = options['square_footage']
    @buy_let_status = options['buy_let_status']
    @id = options['id'].to_i if options['id']
  end

  def save
  db = PG.connect({dbname: 'properties', host: 'localhost'})
  sql = "INSERT INTO properties
  (
    address,
    value,
    square_footage,
    buy_let_status
  ) VALUES
  ($1, $2, $3, $4)
  RETURNING *;"
  values = [@address, @value, @square_footage, @buy_let_status]
  db.prepare("kiwi", sql)
  result = db.exec_prepared("kiwi", values)
  @id = result[0]['id'].to_i
  db.close
  end




end
