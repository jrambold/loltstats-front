class Backend
  def initialize
    @backend = BackendService.new
  end

  def data
    raw_data = @backend.get_url("/teams/list")
  end
end
