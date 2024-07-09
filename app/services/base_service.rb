class BaseService
  include ActiveModel::Validations
  attr_reader :result
  def error_status
    @error_status ||= 400
  end

  def error_code
    @error_code ||= "INVALID"
  end

  def error
    errors.full_messages.to_sentence
  end

  def _publish(params)
    params.each {|name, value| instance_variable_set("@#{name}", value) }
  end
end
