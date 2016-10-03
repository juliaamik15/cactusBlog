class ArticlesController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	load_and_authorize_resource :except => [:show, :index]
		
	 def index
    @articles = Article.all
	 end

	 def show
	 	@article = Article.find(params[:id])
	 	
	 	file_name = @article.file_name
	 	
	 	@comments = @article.comments.paginate(:page => params[:page], :per_page => 2).order("created_at DESC")
	 end

	 def new 
	 	@article = Article.new
	 end

	 def edit
  	@article = Article.find(params[:id])
	 end

	 def create 
	 	Dir.mkdir 'public/uploads' unless File.directory? 'public/uploads'
	 	uploaded_io = params[:article][:picture]
	 	  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    file_name = uploaded_io.original_filename
    @article = Article.new(article_params)
    @article.file_name = file_name

	 	if @article.save
    	redirect_to @article
  	else
    	render 'new'
  	end
	 end

	 def update
  	@article = Article.find(params[:id])
 
  	if @article.update(article_params)
    	redirect_to @article
  	else
    	render 'edit'
  	end
	 end

	 def destroy
  	@article = Article.find(params[:id])
  	@article.destroy

  	redirect_to articles_path
	 end

	 private 
	 def article_params
	 	params.require(:article).permit(:title, :text, :file_name)
	 end


end
