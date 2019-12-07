# frozen_string_literal: true

require './brainfuck.rb'

brainfuck = Brainfuck.new
loop {
  print "=) "
  puts brainfuck.run(readline)
}
