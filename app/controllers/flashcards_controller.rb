class FlashcardsController < ApplicationController
	before_action :set_flashcard, only: %i(show update destroy)

	def index
		@flashcards = Flashcard.all
	end

	def new
		@flashcard = Flashcard.new
	end

	def show
	end

	def create
		@flashcard = Flashcard.new(flashcard_params)

		if @flashcard.save
			flash[:success] = 'Success!'
			redirect_to flashcards_path
		else
			flash[:error] = "Failed to save flashcard because of: #{@flashcard.errors.full_messages.join(". ")}"
			redirect_to new_flashcard_path
		end
	end

	def update
		if @flashcard.update(flashcard_params)
			redirect_to @flashcard
		else
			redirect_to edit_flashcard_path(@flashcard)
		end
	end

	def destroy
		if @flashcard.destroy
			redirect_to flashcards_path
		else
			redirect_to flashcard_path(@flashcard)
		end
	end

	private

	def flashcard_params
		params.require(:flashcard).permit(:word, :translation, :learned)
	end

	def set_flashcard
		@flashcard = Flashcard.find(params[:id])
	end
end
