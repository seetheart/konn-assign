class CreateUserService < BaseService
  def initialize(params)
    @params = params
    _publish(params)
    debugger
  end

  def perform
    create &&
    set_result
  end

  def create
    if @user = User.create(name: @name, email: @email, campaigns_list: @campaigns_list)
    else
      @error_status = '500'
      return false
    end

    true
  end

  def set_result
    @result ||= @user
  end
end
