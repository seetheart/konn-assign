class FetchUsersService < BaseService
  attr_reader :result

  def perform
    find &&
    set_result
  end

  def find
    unless @users = User.all
      @error_status = '500'
      return false
    end

    true
  end

  def set_result
    @result ||= @users
  end
end
