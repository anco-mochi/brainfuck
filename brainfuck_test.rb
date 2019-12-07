# frozen_string_literal: true

require 'minitest/autorun'
require './brainfuck.rb'

class BrainfuckTest < Minitest::Test
  def setup
    @brainfuck = Brainfuck.new
  end

  def test_run
    assert_equal '0', @brainfuck.run('.')
    assert_equal '1', @brainfuck.run('+.')
    assert_equal '0', @brainfuck.run('-.')
    assert_equal '10', @brainfuck.run('+.>.')
    assert_equal '00', @brainfuck.run('.<-.')
    assert_equal '0', @brainfuck.run('[.].')
    assert_equal '0', @brainfuck.run('++++[-].')
    assert_equal 'Hello World!', 
      @brainfuck.run('>+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++
        ++>-]<.>+++++++++++[<+++++>-]<.>++++++++[<+++>-]<.+++.------.--------.[-]>
        ++++++++[<++++>-]<+.')
  end
end
