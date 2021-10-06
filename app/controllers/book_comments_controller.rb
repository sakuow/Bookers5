class BookCommentsController < ApplicationController

  def create
    @book = Book.all
    @books = Book.find(params[:book_id])
    @comment = BookComment.new(book_params)
    @comment.user_id = current_user.id
    @comment.book_id = @books.id
    @comment.save
  end

  def destroy
    @books = Book.all
    @book = Book.find(params[:book_id])
    book_comment = current_user.book_comments.find_by(id: params[:id], book_id: @book.id)
    book_comment.destroy
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment, :user_id, :book_id)
  end
end
