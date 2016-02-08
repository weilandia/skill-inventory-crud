require_relative "../test_helper"

class SkillTest < Minitest::Test
  def test_skill_assigns_attributes_correctly
    skill = Skill.new(
              { name:        "name",
                description: "description",
                id:           1
                })
    assert_equal "name", skill.name
    assert_equal "description", skill.description
    assert_equal 1, skill.id
  end
end
