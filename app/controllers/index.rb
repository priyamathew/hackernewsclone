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

post '/user/:user_id/update' do
  @user = User.find(params[:user_id])
  @user.update_attributes(params[:user])
  @user.save
  redirect "/user?id=#{current_user.id}"
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
    redirect "/"
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

post '/post/:post_id/new_comment' do
  @comment = current_user.comments.create!(text: params[:text], post_id: params[:post_id])
  redirect "/item?id=#{ @comment.post.id }"
end

get '/user/:user_id/posts' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  erb :posts
end

get '/user/:user_id/comments' do
  @user = User.find(params[:user_id])
  @comments = @user.comments
  erb :comments
end

get '/vote/comment/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @comment.comment_vote.increment!(:vote_count)
  redirect "/item?id=#{ @comment.post.id }"
end

get '/vote/post/:post_id' do
  @post = Post.find(params[:post_id])
  @post.post_vote.increment!(:vote_count)
  redirect '/'
end




