class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    database.transaction do
      database[:skills] ||= []
      database[:total] ||= 0
      database[:total] += 1
      database[:skills] << { id: database[:total],
                             name: skill[:name],
                             description: skill[:description]
                           }
    end
  end

  def raw_skills
    database.transaction do
      database[:skills] || []
    end
  end

  def raw_skill(id)
    raw_skills.find { |skill| skill[:id] == id }
  end

  def all
    raw_skills.map { |data| Skill.new(data) }
  end

  def find(id)
    Skill.new(raw_skill(id))
  end

  def update(id, skill)
    database.transaction do
      update = database[:skills].find { |data| data[:id] == id }
      update[:name] = skill[:name]
      update[:description] = skill[:description]
    end
  end

  def delete(id)
    database.transaction do
      database[:skills].delete_if { |data| data[:id] = id }
    end
  end

  def delete_all
    database.transaction do
      database[:skills] = []
      database[:total] = 0
    end
  end
end
