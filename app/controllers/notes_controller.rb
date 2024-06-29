class NotesController < ApplicationController
  def create
    @dead_person = Hero.find(params[:hero_id])
    @note = @hero.notes.build(note_params)
    @note.user = current_user
    if @note.save
      redirect_to @hero, notice: 'Note was successfully added.'
    else
      redirect_to @hero, alert: 'Failed to add note.'
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
