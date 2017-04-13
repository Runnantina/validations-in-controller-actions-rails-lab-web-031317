class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new(author_params)
    @author.save
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
       render 'new'
    end

    # redirect_to author_path(@author) re-renders the form if the new author is invalid
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
