# To change this template, choose Tools | Templates
# and open the template in the editor.
load "declareID.rb"

def SyntoSentence()
  0.upto($syn.length-1) { |i|  
    case $syn[i]
    when 0
      $sentence[i] = 'i'
    when 1
      $sentence[i] = 'r'
    when 2
      $sentence[i] = 's'
    when 3
      $sentence[i] = 'f'
    when 4
      $sentence[i] = 'e'
    when 5
      $sentence[i] = 'd'
    when 6
      $sentence[i] = 'l'
    when 7
      $sentence[i] = 'g'
    when 8
      $sentence[i] = 'p'
    when 9
      $sentence[i] = '+'
    when 10
      $sentence[i] = '-'
    when 11
      $sentence[i] = '*'
    when 12
      $sentence[i] = '/'
    when 13
      $sentence[i] = '&'
    when 14
      $sentence[i] = '!'
    when 15
      $sentence[i] = '='
    when 16
      $sentence[i] = '>'
    when 17
      $sentence[i] = '<'
    when 18
      $sentence[i] = '('
    when 19
      $sentence[i] = ')'
    when 20
      $sentence[i] = ':'
    when 22
      $sentence[i] = 'v'
    when 23
      $sentence[i] = 'm'
    when 24
      $sentence[i] = 'n'
    when 25
      $sentence[i] = 'o'
    end
  }
end
