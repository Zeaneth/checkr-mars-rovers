# Require rspec to run tests automatically once this file is run
require 'rspec/autorun'
require './rovers_team'

RSpec.describe RoversTeam do
  describe '#initialize' do
    it 'recognizes default instructions when none are given' do
      rover = RoversTeam.new
      expect(!!rover.instructions).to be_truthy
    end

    it 'recognizes default instructions when wrong file given' do
      rover = RoversTeam.new('')
      expect(!!rover.instructions).to be_truthy
    end

    it 'recognizes default plateau coordinates when none are given' do
      rover = RoversTeam.new
      expect(!!rover.plateau_coordinates).to be_truthy
    end

    it 'recognizes default mission_report when none are given' do
      rover = RoversTeam.new
      expect(!!rover.mission_report).to be_truthy
    end
  end

  describe '#format_instructions' do
    it 'updates instructions format' do
      rover = RoversTeam.new
      pre_formatted_instructions = rover.instructions
      rover.format_instructions
      expect(rover.instructions).not_to equal(pre_formatted_instructions)
    end

    it 'updates instructions class' do
      rover = RoversTeam.new
      pre_formatted_class = rover.instructions.class
      expect(rover.instructions).to be_a(String)
      rover.format_instructions
      expect(rover.instructions.class).not_to equal(pre_formatted_class)
      expect(rover.instructions).to be_an(Array)
    end
  end

  describe '#set_plateau_position' do
    it 'updates plateau_coordinates' do
      rover = RoversTeam.new
      rover.format_instructions
      pre_set_plateau_values = rover.plateau_coordinates.values
      rover.set_plateau_position
      expect(rover.plateau_coordinates.values).not_to equal(pre_set_plateau_values)
    end
  end

  describe '#set_rovers_quantity' do
    it 'sets Rovers quantity' do
      rover = RoversTeam.new
      expect(rover.rovers_required).to be_nil
      rover.format_instructions
      rover.set_plateau_position
      rover.set_rovers_quantity
      expect(rover.rovers_required).not_to be_nil
    end
  end

  describe '#deploy_rovers' do
    it 'updates_rovers_coordinates' do
      rover = RoversTeam.new
      expect(rover.mission_report.size).to eql(0)
      rover.format_instructions
      rover.set_plateau_position
      rover.set_rovers_quantity
      rover.deploy_rovers
      expect(rover.mission_report).not_to eql(0)
    end
  end
end
