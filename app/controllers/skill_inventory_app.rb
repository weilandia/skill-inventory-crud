require 'yaml/store'

class SkillInventoryApp < Sinatra::Base

  get '/' do
    @skills = skill_inventory.all
    erb :index
  end

  get 'new' do
    erb :skill
  end

  post '/' do
    skill_inventory.create(params[:skill])
    redirect '/'
  end

  get '/:id' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :skill
  end

  get ':id/edit' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :skill
  end

  put ':id' do |id|
    skill_inventory.update(params[:skill, id.to_i])
    redirect "/#{id}"
  end

  delete '/:id/delete' do |id|
    skill_inventory.delete(id.to_i)
    redirect '/'
  end

  def skill_inventory
    if ENV["RACK_ENV"] == 'test'
      database = YAML::STORE.new('db/skill_inventory_test')
    else
      database = YAML::STORE.new('db/skill_inventory')
    end
    @skill_inventory ||= SkillInventory.new(database)
  end
end
