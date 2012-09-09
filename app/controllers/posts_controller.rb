class PostsController < ApplicationController
  respond_to :html, :except => [:up, :down]

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all_ordered
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def own
    @posts = current_user.posts
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

  def up
    @post = Post.find(params[:id])

    current_user.up_vote!(@post)

    render 'vote'
  end

  def down
    @post = Post.find(params[:id])

    current_user.down_vote!(@post)

    render 'vote'
  end
end
