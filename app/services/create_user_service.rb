class CreateUserService < BaseService
  def initialize(params)
    @params = params
    _publish(params)
  end

  def perform
    create &&
    set_result
  end

  def create
    @user = User.create(name: @name, email: @email, campaigns_list: @campaigns_list)

    if @user.save
      return true
    else
      @error_status = '500'
      errors.add(:base, @user.errors.objects.first.full_message)
      return false
    end
  end

  def set_result
    @result ||= @user
  end
end
