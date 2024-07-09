class FilterUsersService < BaseService
  def initialize(filter)
    @filter = filter
  end

  def perform
    find &&
    set_result
  end

  def find
    @users = User.select do |user|
       user.campaigns_list.select do |camp|
        @filter['campaign_names'].split(',').include?(camp["campaign_name"])
       end.present?
    end

    return false unless @users

    true
  end

  def set_result
    @result ||= @users
  end
end
