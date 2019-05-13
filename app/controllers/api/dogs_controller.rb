require 'pry'
class Api::DogsController < ApplicationController
  respond_to :json

  def index
    render :json => read_file
  end

  def show
    json_file = read_file
    dog_hash = JSON.parse(json_file)
    dog_hash.each do |dogs|
      if dogs['id'].to_s == params[:id]
        render :json => dogs.to_json
      end
    end
  end

  def create
    dog_json = Dog.create(dog_params).as_json(:except => [:created_at, :updated_at])
    if read_file.empty?
      save_to_file(dog_json)
    else
      append_to_file(dog_json)
    end
    respond_with :api, dog_params.as_json
  end

  def destroy
    json_file = read_file
    dog_hash = JSON.parse(json_file)
    binding.pry
    dog_hash.each do |dogs|
      if dogs['id'].to_s == params[:id]
        dog_hash.delete(dogs)
      end
    end
    save_to_file(dog_hash.as_json)
    render :json => dog_hash.to_json
  end

  def update
    json_file = read_file
    dog_hash = JSON.parse(json_file)
    binding.pry
    dog_hash.each do |dogs|
      if dogs['id'].to_s == params[:id]
        binding.pry
        dogs.update(dog_params)
        render :json => dogs.to_json
      end
    end
    save_to_file(dog_hash.as_json)
  end

  private

  def dog_params
    params.permit(
        :name,
        :owner_name,
        :notes,
    )
  end

  def read_file
    @@data = File.read("/Users/ealleva/dev/dogs/dog-api/dog-api/dogs.json")
  end

  def save_to_file(json)
    File.open("/Users/ealleva/dev/dogs/dog-api/dog-api/dogs.json","w") do |f|
      f.puts JSON.pretty_generate(json)
    end
  end

  def append_to_file(json)
    json_file = read_file
    File.open("/Users/ealleva/dev/dogs/dog-api/dog-api/dogs.json","w") do |f|
      f.puts JSON.pretty_generate(JSON.parse(json_file) << json)
    end
  end




end
