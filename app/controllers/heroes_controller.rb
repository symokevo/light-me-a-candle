class HeroesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_hero, only: [:show, :edit, :update, :destroy]

  def index
    @heroes = Hero.all
  end

  def show
  end

  def new
    @hero = current_user.heroes.build
  end

  def create
    @hero = current_user.heroes.build(hero_params)
    if @hero.save
      redirect_to @hero, notice: 'Hero was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hero.update(hero_params)
      redirect_to @hero, notice: 'Hero was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hero.destroy
    redirect_to heroes_url, notice: 'Hero was successfully deleted.'
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :image, :note)
  end
end
