class Intro < Chingu::GameState

  def initialize
    super
    self.input = { :space => Play, :escape => :exit }
    $window.caption = "Main Menu"
    @text = Chingu::Text.create("Press Space to Play!", :x => 320, :y => 200, :zorder => 55, :factor_x => 2.0, :factor_y => 2.0, :center_x => 0.5, :center_y => 0.5)
    @text2 = Chingu::Text.create("Press Esc to Quit!", :x => 320, :y => 240, :zorder => 55, :factor_x => 2.0, :factor_y => 2.0, :center_x => 0.5, :center_y => 0.5)
  end

end
