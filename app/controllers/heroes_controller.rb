class HeroesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :increase_candle_count]
  before_action :set_hero, only: [:show, :edit, :update, :destroy, :increase_candle_count, :add_note]

  def index
    @heroes = Hero.all
  end

  def show
    @notes = @hero.notes.order(created_at: :desc)
  end

  def increase_candle_count
    @hero.candles.create!
    redirect_to @hero
  end

  def add_note
    @hero.notes.create!(content: params[:note], created_by: current_user)
    redirect_to @hero
  end

  def new
    @hero = current_user.heroes.build
  end

  def create
    @hero = current_user.heroes.build(hero_params)
    @hero.image.attach(params[:hero][:image])
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
