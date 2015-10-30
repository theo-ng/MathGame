@p1_name = ''
@p2_name = ''
@p1_lives = 3
@p2_lives = 3
@p1_score = 0
@p2_score = 0

@num1 = 0
@num2 = 0
@question = 0

@turn = 1

@start = Time.now
@end = Time.now
@dead = ''
@winner = ''

MAX = 10
MAX_LENGTH = 7

@type = {
  0 => '+',
  1 => '-',
  2 => '*'
}