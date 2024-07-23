class CandlesController < ApplicationController
  before_action :set_hero

  def create
    @candle = @hero.candles.build
    if @candle.save
      redirect_to @hero, notice: 'Candle was successfully lit.'
    else
      redirect_to @hero, alert: 'Failed to light candle.'
    end
  end

  private

  def set_hero
    @hero = Hero.find(params[:hero_id])
  end
end
