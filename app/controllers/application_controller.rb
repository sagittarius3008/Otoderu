class ApplicationController < ActionController::Base
  include Nav
  before_action :new_apply
end
