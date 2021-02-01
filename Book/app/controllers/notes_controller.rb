class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]
    
	
	def index
	  if params[:category].blank?
		@notes = Note.all.order("created_at DESC")
	  else
		@category_id = Category.find_by(name: params[:category]).id
		  
		@notes = Note.where(:category_id => @category_id).order("created_at DESC")
	  end
	end

	def show

	end

	def new
		@note = current_user.notes.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@note = current_user.notes.build(note_params)
		@note.category_id = params[:category_id]

		if @note.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@note.category_id = params[:category_id]

		if @note.update(note_params)
			redirect_to note_path(@note)
		else
			render 'edit'
	
		end
	end

	def destroy
		@note.destroy
		redirect_to root_path
	end

	private

	 def note_params
	 	params.require(:note ).permit(:title, :description, :author, :category_id, :note_img)
	 end

	 def find_note
	 	@note = Note.find(params[:id])
	 end

end
