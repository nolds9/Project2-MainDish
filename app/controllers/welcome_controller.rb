class WelcomeController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy] # NHO: is this appropriate here?
  before_action :authenticate_user!, except: [:index, :show]
  def index

  end
end
