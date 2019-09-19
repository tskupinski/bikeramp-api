class GoogleMaps::Error < StandardError
  def initialize(response)
    super(error_message(response))
  end

  private

  def error_message(response)
    if response['status'] == 'OK'
      'Path not found'
    else
      response['status']&.humanize || 'Invalid request'
    end
  end
end
