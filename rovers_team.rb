# Used for debugging during development.
require 'pry'

class RoversTeam
  attr_accessor :instructions, :plateau_coordinates, :mission_report, :rovers_required

  def initialize(instructions_file_path = 'default_instructions.txt')
    @plateau_coordinates = { left_x: 0, left_y: 0, right_x: nil, right_y: nil }
    @mission_report = []
    @instructions = File.read(instructions_file_path)
  rescue StandardError => _e
    puts 'There was a problem reading you desired instructions file, so the default one was chosen.'
    @instructions = File.read('default_instructions.txt')
  end

  def start_mission
    # TODO: Could validate required data if an error happened
    format_instructions
    set_plateau_position
    set_rovers_quantity
    deploy_rovers
    share_mission_report
  end

  def format_instructions
    # TODO: Could clean invalid characters
    @instructions = @instructions.split("\n")
  end

  def set_plateau_position
    location = @instructions.shift.split(' ').map(&:to_i)
    @plateau_coordinates[:right_x] = location.first
    @plateau_coordinates[:right_y] = location.last
  end

  def set_rovers_quantity
    @rovers_required = @instructions.size / 2
  end

  def deploy_rovers
    @rovers_required.times do |_i|
      @mission_report << follow_instructions
    end
  end

  def follow_instructions
    current_coordinates = format_coordinates(@instructions.shift)
    commands = @instructions.shift.split('')
    follow_commands(commands, current_coordinates)
  end

  def format_coordinates(string)
    coordinates = string.split(' ')
    { x: coordinates[0].to_i, y: coordinates[1].to_i, facing: coordinates[2] }
  end

  def follow_commands(commands, current_coordinates)
    return current_coordinates if commands.empty?

    new_coordinates = move(commands.shift, current_coordinates)
    follow_commands(commands, new_coordinates)
  end

  def move(instruction, coordinates)
    case instruction
    when 'L' then turn_left(coordinates)
    when 'R' then turn_right(coordinates)
    else move_forward(coordinates)
    end
  end

  def turn_left(rover_coordinates)
    # TODO: Could be hash lookup
    result =
      case rover_coordinates[:facing]
      when 'N' then 'W'
      when 'W' then 'S'
      when 'S' then 'E'
      when 'E' then 'N'
      end
    rover_coordinates[:facing] = result
    rover_coordinates
  end

  def turn_right(rover_coordinates)
    # TODO: Could be hash lookup
    result =
      case rover_coordinates[:facing]
      when 'N' then 'E'
      when 'E' then 'S'
      when 'S' then 'W'
      when 'W' then 'N'
      end
    rover_coordinates[:facing] = result
    rover_coordinates
  end

  def move_forward(rover_coordinates)
    case rover_coordinates[:facing]
    when 'N'
      plateau_visible?(rover_coordinates, 'y') && rover_coordinates[:y] += 1
    when 'S'
      plateau_visible?(rover_coordinates, 'y') && rover_coordinates[:y] -= 1
    when 'E'
      plateau_visible?(rover_coordinates, 'x') && rover_coordinates[:x] += 1
    when 'W'
      plateau_visible?(rover_coordinates, 'x') && rover_coordinates[:x] -= 1
    else
      puts "There was an unrecognized command: #{rover_coordinates[:facing]}."
    end
    rover_coordinates
  end

  # Checks wether there's still plateau 'space' for the rover to move to
  def plateau_visible?(coordinates, axis)
    coordinates[axis.to_sym].positive? || coordinates[axis.to_sym] <= @plateau_coordinates["right_#{axis}".to_sym]
  end

  def share_mission_report
    official_statement =
      @mission_report.map { |coords| "#{coords[:x]}, #{coords[:y]}, #{coords[:facing]}" }
                     .join("\n")
    puts official_statement
  end
end
