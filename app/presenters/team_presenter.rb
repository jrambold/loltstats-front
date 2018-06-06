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
        @lanes << TeamLane.new(lane[0],
                lane[1][:name],
                lane[1][:percent],
                lane[1][:wins],
                lane[1][:losses],
                lane[1][:total])
      end

    end

end

class TeamLane
  attr_reader :role,
              :name,
              :wins,
              :losses,
              :total

  def initialize(role, name, percent, wins, losses, total)
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
