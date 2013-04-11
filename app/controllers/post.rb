Blog::App.controllers :post do

  # see Active Record Query Interface! (from schoology link)
  
  before do
    @posts = []
  end

  #All posts
  get :index do
    @posts = Post.all
    render 'post/index'
  end

  #Posts by author
  get ':authorname' do
    @posts = Author.find_by_name(params[:authorname]).posts
    render 'post/index'
  end

  #Posts by author and article ID 
  get ':authorname/:id' do
    @posts = Author.find_by_name(params[:authorname]).posts[0]
    render 'post/index'
  end

  #Posts by tag 
  get 'tagged/:tag' do
    @posts = Tag.find_by_name(params[:tag]).posts
    render 'post/index'
  end
  
  #find by date
  get 'archive/:month/:year' do
    @posts = Post.where("created_at > ? and created_at < ?", Time.new(params[:year],params[:month],1),Time.new(params[:year],params[:month]+1,1))
    render 'post/index'
  end

  #find by date
  get 'archive/:month/:year' do
    @posts = Post.where("created_at > ? and created_at < ?", Time.new(params[:year],params[:month],1),Time.new(params[:year],params[:month]+1,1))
    render 'post/index'
  end


  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
