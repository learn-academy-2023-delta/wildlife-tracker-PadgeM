class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    render json: animals
  end

  def show
    animal = Animal.find(params[:id])
    render json: animal
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      render json: animal, status: :created
    else
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  def update
    animal = Animal.find(params[:id])
    if animal.update(animal_params)
      render json: animal
    else
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    head :no_content
  end

  private

  def animal_params
    params.require(:animal).permit(:common_name, :scientific_binomial)
  end
end

