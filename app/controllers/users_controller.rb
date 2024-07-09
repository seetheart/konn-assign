class UsersController < ApplicationController
  def index
    serv = FetchUsersService.new
    render_service(serv)
  end

  def create
    serv = CreateUserService.new(user_params)
    render_service(serv)
  end

  def filter
    serv = FilterUsersService.new(filter_params)
    render_service(serv)
  end

  private

  def user_params
    params.permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
  end

  def filter_params
    params.permit(:campaign_names)
  end
end
