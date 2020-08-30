class ReviewlistsController < ApplicationController
  def index
    @purposes = Purpose.where(open: true).order(id: :desc)
  end
end
