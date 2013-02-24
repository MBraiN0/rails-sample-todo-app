class CommentsController < ApplicationController
  # GET posts/1/comments
  # GET posts/1/comments.json
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET posts/1/comments/1
  # GET posts/1/comments/1.json
  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET posts/1/comments/new
  # GET posts/1/comments/new.json
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET posts/1/comments/1/edit
  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  # POST posts/1/comments
  # POST posts/1/comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
        format.json { render :json => @comment, :status => :created, :location => [@comment.post, @comment] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT posts/1/comments/1
  # PUT posts/1/comments/1.json
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE posts/1/comments/1
  # DELETE posts/1/comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_comments_url(post) }
      format.json { head :ok }
    end
  end
end
