class Flashcard < ApplicationRecord
	validates_presence_of :word, :translation
end
