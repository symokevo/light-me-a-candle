class CandlesController < ApplicationController
  before_action :authenticate_user!

  def create
    @dead_person = Hero.find(params[:hero_id])
    @candle = @hero.candles.build(user: current_user)
    if @candle.save
      redirect_to @hero, notice: 'Candle was successfully lit.'
    else
      redirect_to @hero, alert: 'Failed to light candle.'
    end
  end
end
