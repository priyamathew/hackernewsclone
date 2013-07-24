get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/user' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :profile
end

get '/item' do
  @post = Post.find(params[:id])
  @comments = @post.comments 
  erb :post
end 

get '/login' do
  erb :login
end

post '/login' do 
  p params
  p params[:user][:username]
  @user = User.find_by_username(params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:current_user] = @user.id
    redirect "/user?id=#{@user.id}"
  else
    redirect '/login'
  end
end

get '/logout' do 
  session.clear
  redirect '/'
end

post '/signup' do
  p params
  @user = User.new(params[:user])
  if @user.save
    session[:current_user] = @user.id
    redirect "/user?id=#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :login
  end
end

get '/post/new' do
  erb :new_post
end

post '/new_post' do
  if current_user
    post = current_user.posts.create(params[:post])
    redirect "/item?id=#{ post.id }"
  else
    redirect '/login'
  end
end









