class NotesController < ApplicationController

  def index
  end

  def new
    @user = User.new
    @note = @user.notes.build
  end

  def create
    if current_user
      @user = User.find(current_user.id)
      note = @user.notes.create(note_params)
      note.readers << current_user if current_user
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def show
    end

  def edit 
    end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy
    end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to, :user_id)
    end

    def current_user
      User.find_by(id: session[:user_id])
    end 



end