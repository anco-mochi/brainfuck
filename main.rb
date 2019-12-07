# frozen_string_literal: true

require './brainfuck.rb'

brainfuck = Brainfuck.new
loop { puts brainfuck.run(readline) }
