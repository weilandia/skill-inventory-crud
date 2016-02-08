class Skill
  attr_accessor :name, :description, :id

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @description = data[:description]
  end
end
