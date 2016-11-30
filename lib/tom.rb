class Tamagotchi
  @@myStats = []
  define_method(:initialize) do |name|
    @food_level = 10
    @sleep_level = 10
    @attention_level = 10
    @name = name
    @sleep_time = Time.new()
    @food_time = Time.new()
    @attention_time = Time.new()

  end
  define_method(:name) do
    @name
  end
  define_method(:food_level) do
    @food_level
  end
  define_method(:sleep_level) do
    @sleep_level
  end
  define_method(:attention_level) do
    @attention_level
  end

  define_method(:check_in) do
    current_time = Time.new()
    sleep_time = current_time - @sleep_time
    if sleep_time >= 57600
      return "death"
    elsif sleep_time >= 51840
      @sleep_level = 1
    elsif sleep_time >= 46080
      @sleep_level = 2
    elsif sleep_time >= 40320
      @sleep_level = 3
    elsif sleep_time >= 34560
      @sleep_level = 4
    elsif sleep_time >= 28800
      @sleep_level = 5
    elsif sleep_time >= 23040
      @sleep_level = 6
    elsif sleep_time >= 17280
      @sleep_level = 7
    elsif sleep_time >= 11520
      @sleep_level = 8
    elsif sleep_time >= 5760
      @sleep_level = 9
    else
      @sleep_level = 10
    end
    food_time = current_time - @food_time
    if food_time >= 14400
      return "death"
    elsif food_time >= 12960
      @food_level = 1
    elsif food_time >= 11520
      @food_level = 2
    elsif food_time >= 10080
      @food_level = 3
    elsif food_time >= 8640
      @food_level = 4
    elsif food_time >= 7200
      @food_level = 5
    elsif food_time >= 5760
      @food_level = 6
    elsif food_time >= 4320
      @food_level = 7
    elsif food_time >= 2880
      @food_level = 8
    elsif food_time >= 1440
      @food_level = 9
    else
      @food_level = 10
    end
    attention_time = current_time - @attention_time
    if attention_time >= 600
      return "death"
    elsif attention_time >= 540
      @attention_level = 1
    elsif attention_time >= 480
      @attention_level = 2
    elsif attention_time >= 420
      @attention_level = 3
    elsif attention_time >= 360
      @attention_level = 4
    elsif attention_time >= 300
      @attention_level = 5
    elsif attention_time >= 240
      @attention_level = 6
    elsif attention_time >= 180
      @attention_level = 7
    elsif attention_time >= 120
      @attention_level = 8
    elsif attention_time >= 60
      @attention_level = 9
    else
      @attention_level = 10
    end
    current_levels = [@food_level, @sleep_level, @attention_level]
  end

  define_method(:feed) do
    current_time = Time.new()
    food_time = current_time - @food_time
    if food_time >= 14400
      return "death"
    end
    @food_time = Time.new()
    self.check_in
  end

  define_method(:sleep) do
    current_time = Time.new()
    sleep_time = current_time - @sleep_time
    if sleep_time >= 57600
      return "death"
    end
    @sleep_time = Time.new()
    self.check_in
  end

  define_method(:play) do
    current_time = Time.new()
    attention_time = current_time - @attention_time
    if attention_time >= 600
      return "death"
    end
    @attention_time = Time.new()
    self.check_in
  end

  define_method(:save) do
    @@myStats.push(@food_level)
    @@myStats.push(@food_time)
    @@myStats.push(@sleep_level)
    @@myStats.push(@sleep_time)
    @@myStats.push(@attention_level)
    @@myStats.push(@attention_time)
    @@myStats.push(@name)
  end

  define_singleton_method(:all) do
    @@myStats
  end
end
