class AddQuestionsJob < ApplicationJob
	queue_as :default

	def perform
		require 'open-uri'
		require 'json'

		# Category: Science, Sub: Computers
		response = open('https://opentdb.com/api.php?amount=3&category=18&type=multiple').read
		response = JSON.parse(response)
		if response['response_code'] == 0
			for current in response['results']
				@question = Question.new()
				@question.question = current['question']
				@question.category = 'Science' 
				@question.subcat = 'Computers'
				@question.option1 = current['correct_answer'] 
				@question.option2 = current['incorrect_answers'][0] 
				@question.option3 = current['incorrect_answers'][1]
				@question.option4 = current['incorrect_answers'][2]
				@question.answer = current['correct_answer'] 
				if Question.where(question: response['question']).first == nil
					@question.save
				end
			end
		end

		
		# Category: Science, Sub: Nature
		response = open('https://opentdb.com/api.php?amount=3&category=17&type=multiple').read
		response = JSON.parse(response)
		if response['response_code'] == 0
			for current in response['results']
				@question = Question.new()
				@question.question = current['question']
				@question.category = 'Science' 
				@question.subcat = 'Nature'
				@question.option1 = current['correct_answer'] 
				@question.option2 = current['incorrect_answers'][0] 
				@question.option3 = current['incorrect_answers'][1]
				@question.option4 = current['incorrect_answers'][2]
				@question.answer = current['correct_answer'] 
				if Question.where(question: response['question']).first == nil
					@question.save
				end
			end
		end


		# Category: Entertainment, Sub: Television
		response = open('https://opentdb.com/api.php?amount=3&category=14&type=multiple').read
		response = JSON.parse(response)
		if response['response_code'] == 0
			for current in response['results']
				@question = Question.new()
				@question.question = current['question'] 
				@question.category = 'Entertainment' 
				@question.subcat = 'Television' 
				@question.option1 = current['correct_answer'] 
				@question.option2 = current['incorrect_answers'][0] 
				@question.option3 = current['incorrect_answers'][1]
				@question.option4 = current['incorrect_answers'][2]
				@question.answer = current['correct_answer'] 
				if Question.where(question: response['question']).first == nil
					@question.save
				end
			end
		end


		# Category: Entertainment, Sub: Books
		response = open('https://opentdb.com/api.php?amount=3&category=10&type=multiple').read
		response = JSON.parse(response)
		if response['response_code'] == 0
			for current in response['results']
				@question = Question.new()
				@question.question = current['question'] 
				@question.category = 'Entertainment' 
				@question.subcat = 'Books' 
				@question.option1 = current['correct_answer'] 
				@question.option2 = current['incorrect_answers'][0] 
				@question.option3 = current['incorrect_answers'][1]
				@question.option4 = current['incorrect_answers'][2]
				@question.answer = current['correct_answer'] 
				if Question.where(question: response['question']).first == nil
					@question.save
				end
			end
		end


		# Category: Entertainment, Sub: Music
		response = open('https://opentdb.com/api.php?amount=3&category=12&type=multiple').read
		response = JSON.parse(response)
		if response['response_code'] == 0
			for current in response['results']
				@question = Question.new()
				@question.question = current['question'] 
				@question.category = 'Entertainment' 
				@question.subcat = 'Music' 
				@question.option1 = current['correct_answer'] 
				@question.option2 = current['incorrect_answers'][0] 
				@question.option3 = current['incorrect_answers'][1]
				@question.option4 = current['incorrect_answers'][2]
				@question.answer = current['correct_answer'] 
				if Question.where(question: response['question']).first == nil
					@question.save
				end
			end
		end

	end

end