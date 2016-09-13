class ArticlesController < ApplicationController

	#GET /articles
	def index
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		@article = Article.find(params[:id])
	end

	#Get /articles/new
	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	#Post /articles
	def create
		@article = Article.new(article_params)
		if @article.save
		redirect_to @article
		else
			render :new
		end	
	end

	def destroy
		#DELETE FROM  article
		@article = Article.find(params[:id])
		@article.destroy #Elimina el objeto de la base de datos
		redirect_to articles_path
	end

	#PUT /articles/:id
	def update
		#UPDATE
		#@article.update_atributes({title: 'Nuevo título'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end


	private

	def article_params
		params.require(:article).permit(:title,:body)
	end
end