require('sinatra')
require('sinatra/reloader')
require('./lib/tom')
require('capybara/rspec')
also_reload('lib/**/*.rb')

@name = ""
@food = 0
@sleep = 0
@attention = 0
@sleep_time = Time.new()
@food_time = Time.new()
@attention_time = Time.new()

get('/') do
  erb(:index)
end

post('/startup') do
  @myPet = Tamagotchi.new(params.fetch('name'))
  @myPet.save()
  @stats = Tamagotchi.all()
  @food = @stats[0]
  @food_time = @stats[1]
  @sleep = @stats[2]
  @sleep_time = @stats[3]
  @attention = @stats[4]
  @attention_time = @stats[5]
  @name = @stats[6]
  erb(:mypet)
end

post('/check') do
  @stats = Tamagotchi.all()
  @food = @stats[0]
  @food_time = @stats[1]
  @sleep = @stats[2]
  @sleep_time = @stats[3]
  @attention = @stats[4]
  @attention_time = @stats[5]
  @name = @stats[6]
  erb(:mypet)
end
