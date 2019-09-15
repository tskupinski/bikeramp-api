module RequestHelpers
  def json_response
    @json_response ||= JSON.parese(response.body)
  end
end
