class BackendService
  def initialize
    @headers = {  }
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(JSON.parse(response.body, symbolize_names: true))
  end

  private
    attr_reader :headers

    def conn
      Faraday.new('http://localhost:8000', headers: headers)
    end
end
