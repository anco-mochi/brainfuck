# frozen_string_literal: true

class Brainfuck
  def initialize
    @array = Array.new(256, 0)
    @pointer = 0
  end

  def run(code)
    output = ''
    @read_at = 0
    @code = code

    while @read_at <= @code.size
      case @code[@read_at]
      when '.' then output += value_to_char
      when '+' then increment_value
      when '-' then decrement_value
      when '>' then increment_pointer
      when '<' then decrement_pointer
      when '[' then jump_to_right_bracket
      when ']' then jump_to_left_bracket
      end

      @read_at += 1
    end

    output
  end

  private
  def value_to_char
    if (@array[@pointer] >= 0x20) && (@array[@pointer] <= 0x7e)
      @array[@pointer].chr
    else
      @array[@pointer].to_s
    end
  end

  def increment_value
    @array[@pointer] += 1
  end

  def decrement_value
    @array[@pointer] -= 1
  end

  def increment_pointer
    @pointer += 1
  end

  def decrement_pointer
    @pointer -= 1
  end

  def jump_to_right_bracket
    if @array[@pointer].zero?
      @read_at += 1 until @code[@read_at] == ']'
    end
  end

  def jump_to_left_bracket
    unless @array[@pointer].zero?
      @read_at -= 1 until @code[@read_at] == '['
    end
  end
end
