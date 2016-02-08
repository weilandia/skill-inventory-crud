require_relative "../test_helper"

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_skill
    data = {
      name:       "some name",
      description: "some description"
    }

    skill_inventory.create(data)

    skill = skill_inventory.all.last

    assert skill.id
    assert_equal "some name", skill.name
    assert_equal "some description", skill.description
  end

  def test_can_list_all_skills
    3.times do
      data = {
        name:       "some name",
        description: "some description"
      }

      skill_inventory.create(data)
    end

    assert_equal 3, skill_inventory.all.length
  end


  def test_can_find_specific_skill
    3.times do
      data = {
        name:       "some name",
        description: "some description"
      }

      skill_inventory.create(data)
    end

    assert_equal Skill, skill_inventory.find(3).class
    assert_equal 3, skill_inventory.find(3).id
  end

  def test_can_update_skill
    data = {
      name:       "some name",
      description: "some description"
    }

    skill_inventory.create(data)
    update_data = { name: "update", description: "some description" }

    skill_inventory.update(1, update_data)

    assert_equal "update", skill_inventory.find(1).name
  end

  def test_can_delete_specific_skill
    data = {
      name:       "some name",
      description: "some description"
    }

    skill_inventory.create(data)

    skill_inventory.delete(1)

    assert skill_inventory.all.empty?
  end
end
