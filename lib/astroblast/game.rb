class Game < Chingu::Window
  WIDTH = 1024
  HEIGHT = 768

  def initialize
    super(Game::WIDTH, Game::HEIGHT, false)
    puts "Root Path: #{ROOT}"

    Image.autoload_dirs << File.join(ROOT, '..', 'application', 'gfx')
    Image.autoload_dirs << File.join(ROOT, '..', 'gfx')
    Sound.autoload_dirs << File.join(ROOT, '..', 'application', 'sfx')
    Sound.autoload_dirs << File.join(ROOT, '..', 'sfx')

    puts "Image.autoload_dirs: #{Image.autoload_dirs}"
 
    push_game_state(Intro)
  end
end

