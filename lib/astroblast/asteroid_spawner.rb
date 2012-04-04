class AsteroidSpawner < Chingu::GameObject
  traits :timer

  def setup
    every(1000) { Asteroid.create() }
  end
end
