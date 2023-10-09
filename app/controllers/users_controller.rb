# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:disable Style/Documentation
  before_action :authenticate_user!
  def index; end
end
