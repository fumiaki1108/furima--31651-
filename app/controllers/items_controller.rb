class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit, :destroy]

  def index
  end

end
