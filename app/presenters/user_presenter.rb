class UserPresenter
  attr_reader :solo_lanes,
              :flex_lanes

  def initialize(solo_stats, flex_stats)
    @solo_lanes = []
    @flex_lanes = []
    lanestats(solo_stats, @solo_lanes)
    lanestats(flex_stats, @flex_lanes)
  end

  private

    attr_reader :best

    def lanestats(stats, array)
      stats.each do |lane|
        array << Lane.new(lane[0],
                lane[1][:percent],
                lane[1][:wins],
                lane[1][:losses],
                lane[1][:total])
      end
    end

end

class Lane
  attr_reader :role,
              :wins,
              :losses,
              :total

  def initialize(role, percent, wins, losses, total)
    @role = role
    @percent = percent
    @wins = wins
    @losses = losses
    @total = total
  end

  def percent
    @percent.round(2)
  end
end
