class GamesController < ApplicationController
	def new
		if not session[:user_id].nil?
			@user = User.find(session[:user_id])
			render 'new'
		else
			redirect_to login_path, :alert => "You must be logged in!"
		end
	end
	def update
		@user = User.find(session[:user_id])
		new_choice = params[:new]
		cont_choice = params[:cont]
		tmp = rand(5)
		if cont_choice.nil?
			if new_choice == 'newa'
				if @user.games.where(category: "Science", subcat: "Computers").first.nil?
					@user.games.create(user_id: session[:id],category: "Science", subcat: "Computers", state: "1", curr: 0, highest: 0)
				end
				@user.games.where(category: "Science", subcat: "Computers").first.update(state: "#{tmp}")
				@user.games.where(category: "Science", subcat: "Computers").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Science', :id2 => 'Computers'
			elsif new_choice == 'newb'
				if @user.games.where(category: "Science", subcat: "Nature").first.nil?
					@user.games.create(user_id: session[:id],category: "Science", subcat: "Nature", state: "1", curr: 0, highest: 0)
				end
				@user.games.where(category: "Science", subcat: "Nature").first.update(state: "#{tmp}")
				@user.games.where(category: "Science", subcat: "Nature").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Science', :id2 => 'Nature'
			elsif new_choice == 'newc'
				if @user.games.where(category: "Entertainment", subcat: "Television").first.nil?
					@user.games.create(user_id: session[:id],category: "Entertainment", subcat: "Television", state: "1", curr: 0, highest: 0)
				end
				@user.games.where(category: "Entertainment", subcat: "Television").first.update(state: "#{tmp}")
				@user.games.where(category: "Entertainment", subcat: "Television").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Entertainment', :id2 => 'Television'
			elsif new_choice == 'newd'
				if @user.games.where(category: "Entertainment", subcat: "Books").first.nil?
					@user.games.create(user_id: session[:id],category: "Entertainment", subcat: "Books", state: "1", curr: 0, highest: 0)
				end
				@user.games.where(category: "Entertainment", subcat: "Books").first.update(state: "#{tmp}")
				@user.games.where(category: "Entertainment", subcat: "Books").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Entertainment', :id2 => 'Books'
			elsif new_choice == 'newe'
				if @user.games.where(category: "Entertainment", subcat: "Music").first.nil?
					@user.games.create(user_id: session[:id],category: "Entertainment", subcat: "Music", state: "1", curr: 0, highest: 0)
				end
				@user.games.where(category: "Entertainment", subcat: "Music").first.update(state: "#{tmp}")
				@user.games.where(category: "Entertainment", subcat: "Music").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Entertainment', :id2 => 'Music'
			end
		else
			if cont_choice == 'conta'
				# @user.games.where(category: "Science", subcat: "Computers").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Science', :id2 => 'Computers'
			elsif cont_choice == 'contb'
				# @user.games.where(category: "Science", subcat: "Nature").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Science', :id2 => 'Nature'
			elsif cont_choice == 'contc'
				# @user.games.where(category: "Entertainment", subcat: "Television").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Entertainment', :id2 => 'Television'
			elsif cont_choice == 'contd'
				# @user.games.where(category: "Entertainment", subcat: "Books").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Entertainment', :id2 => 'Books'
			elsif cont_choice == 'conte'
				# @user.games.where(category: "Entertainment", subcat: "Music").first.update(curr: 0)
				redirect_to :action => 'quest', :id1 => 'Entertainment', :id2 => 'Music'
			end
		end
	end
	def quest
		@user = User.find(session[:user_id])
		@ugame = @user.games.where(category: request[:id1], subcat: request[:id2]).first
		start = @ugame.state.to_i
		@questi = Question.where(category: request[:id1], subcat: request[:id2]).offset(start).first
		render 'question'
	end
	def updatequest
		@user = User.find(session[:user_id])
		@ugame = @user.games.where(category: request[:id1], subcat: request[:id2]).first
		@temp = @ugame.curr
		start = @ugame.state.to_i
		@questi = Question.where(category: request[:id1], subcat: request[:id2]).offset(start).first
		puts "ANSWERS!!!"
		puts @questi.answer
		if @questi.typ != 2
			if params[:choice] == @questi.answer
				curr_score = @ugame.curr
				@ugame.update(curr: curr_score + 1)
				max = if (@ugame.curr > @ugame.highest) then @ugame.curr else @ugame.highest end
				@ugame.update(highest: max)
				newstart = ((start + 1) % 4).to_s
				@ugame.update(state: newstart)
				redirect_to :action => 'quest', :id1 => request[:id1], :id2 => request[:id2]
			else
				max = if (@ugame.curr > @ugame.highest) then @ugame.curr else @ugame.highest end
				@ugame.update(highest: max)
				@ugame.update(curr: 0)
				render 'incorrect'
			end
		elsif @questi.typ == 2
			ans = [params[:choice1], params[:choice2], params[:choice3], params[:choice4]].join(";")
			if ans == @questi.answer
				curr_score = @ugame.curr
				@ugame.update(curr: curr_score + 1)
				newstart = ((start + 1) % 5).to_s
				@ugame.update(state: newstart)
				redirect_to :action => 'quest', :id1 => request[:id1], :id2 => request[:id2]
			else
				max = if (@ugame.curr > @ugame.highest) then @ugame.curr else @ugame.highest end
				@ugame.update(highest: max)
				@ugame.update(curr: 0)
				render 'incorrect'
			end
		end
	end
end





