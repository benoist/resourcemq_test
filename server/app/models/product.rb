class Product < Struct.new(:name, :price)
  def self.paginate(*args)

  end

  def self.total

  end

  def self.all
    [Product.new('test', 1)]
  end

  def self.build(*args)
    self.new(*args)
  end

  def self.find(id)
    Product.new('test', 1)
  end

  def update_attribute(attributes)

  end

  def save

  end
end
