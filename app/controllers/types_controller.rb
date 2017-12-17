class TypesController < ApplicationController
  before_action :require_login

  def index
	@types = Type.all
  end
end