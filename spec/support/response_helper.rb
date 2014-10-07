module ResponseHelper
  def response
    case last_request.content_type
      when 'text/html', 'text/plain'
        last_response.body
      else
        JSON.parse(last_response.body)
    end
  end
end
