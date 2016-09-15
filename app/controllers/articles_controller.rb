class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_article, except: [:index,:new, :create]

	#GET /articles
	def index
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		@article.update_visits_count
		@comment = Comment.new
	end

	#Get /articles/new
	def new
		@article = Article.new
	end

	def edit
	end

	#Post /articles
	def create
		@article = current_user.articles.new(article_params)
		if @article.save
		redirect_to @article
		else
			render :new
		end	
	end

	def destroy
		#DELETE FROM  article
		@article.destroy #Elimina el objeto de la base de datos
		redirect_to articles_path
	end

	#PUT /articles/:id
	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end


	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title,:body)
	end

end