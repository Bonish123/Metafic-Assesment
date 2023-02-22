class BlogsController < ApplicationController
  before_action :get_blog, only: %i[update destroy]

  # Fetch all blogs
  def index
    @blogs = Blog.all
    if @blogs
      render json: { blogs: @blogs }, status: :ok
    else
      render json: { message: 'Unable to fetch blogs' }, status: 400
    end
  end

  # Create new blog
  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: { message: 'Blog is created successfully' }, status: :ok
    else
      render json: { message: 'Unable to create blog' }, status: 400
    end
  end

  # Update blog
  def update
    if @blog.present?
      if @blog.update(blog_params)
        render json: { blog: @blog }, status: :ok
      else
        render json: { message: 'Unable to update blog' }
      end
    else
      render json: { message: 'Unable to find blog' }
    end
  end

  # Delete blog
  def destroy
    if @blog.present?
      if @blog.destroy
        render json: { message: 'Blog has been deleted successfully' }, status: :ok
      else
        render json: { message: 'Unable to delete blog' }, status: 400
      end
    else
      render json: { message: 'Unable to find blog' }
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :author_name, :is_active)
  end

  def get_blog
    @blog = Blog.find_by(id: params[:id])
  end
end