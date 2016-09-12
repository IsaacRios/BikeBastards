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

	#Post /articles
	def create
		@article = Article.new(title: params[:article][:title], body: params[:article][:body])

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
	end
end