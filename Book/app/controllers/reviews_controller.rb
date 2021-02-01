class ReviewsController < ApplicationController

	before_action :find_note
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.note_id = @note.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to note_path(@note)
		else
			render 'new'
		end
	end
	def edit
	end
	def update
	
		if @review.update(review_params)
			redirect_to note_path(@note)
		else 
		    render 'edit'
		end
	end
	def destroy
		@review.destroy
		redirect_to note_path(@note)
	end

	private

	  def review_params
	  	params.require(:review).permit(:rating, :comment)
	  end

	  def find_note
	  	@note = Note.find(params[:note_id])
	  end
	  def find_review
	  	@review = Review.find(params[:id])
	  end

end
