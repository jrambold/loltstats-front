class TeamPresenter
  attr_reader :lanes

  def initialize(best)
    @lanes = []
    lanestats(best)
  end

  private

    attr_reader :best

    def lanestats(best)
      best.each do |lane|
        @lanes << Lane.new(lane[0],
                lane[1][:name])
      end

    end

end

class Lane
  attr_reader :role,
              :name,
              :wins,
              :losses,
              :total

  def initialize(role=nil, name=nil, percent=nil, wins=nil, losses=nil, total=nil)
    @role = role
    @name = name
    @percent = percent
    @wins = wins
    @losses = losses
    @total = total
  end

  def percent
    @percent.round(2)
  end
end
