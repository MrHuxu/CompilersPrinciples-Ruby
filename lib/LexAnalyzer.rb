# To change this template, choose Tools | Templates
# and open the template in the editor.
load "declareID.rb"

def LexAnalyzer(fileName)
  
  #将文件内容逐行读入数组，get_line每行为字符串
  get_line = []
  file = File.open(fileName) 
  file.each  { |line|
    get_line[get_line.length] = line
  }

  #将某些输入习惯没有空格的界符添加空格
  0.upto(get_line.length - 1){|i|
    j = 0
    while j <= get_line[i].length - 1
      case get_line[i][j].chr
      when';',',',')','{','}'
        get_line[i].insert(j, " ")
        j = j + 2
      when'(','"'
        get_line[i].insert(j + 1, " ")
        get_line[i].insert(j, " ")
        j = j + 2
      else
        j = j + 1
      end
    end
  }

  #将get_line中的字符串根据 空格分割成小字符串构成的数组
  #line_split是一个二维数组，第一维代表行，一个元素所在二维在line_split中的下角标+1就是行数
  line_split = []
  0.upto(get_line.length - 1) { |i| 
    line_split[i] = get_line[i].split(" ")
  }

  #如果出现#号，就是注释部分，将整行后面的字符串集中并将后几位清零
  0.upto(line_split.length - 1) { |i|  
    0.upto(line_split[i].length - 1) { |j|  
      if line_split[i][j][0].chr == '#'
        line_split[i][j] = line_split[i][j..(line_split[i].length - 1)].join(" ")
        line_split[i][(j + 1)..(line_split[i].length - 1)] = nil
        $token[$token.length] = line_split[i][j]
        $getNumofLine[$token.length - 1] = i + 1
        break
      end    
      $token[$token.length] = line_split[i][j]
      $getNumofLine[$token.length - 1] = i + 1
    }
  }
  
  #逐个扫描$token[]中的字符串
  0.upto($token.length - 1) { |i|
    case $token[i]
    when "main"
      $syn[i] = 0
    when"if"
      $syn[i] = 1
    when"then"
      $syn[i] = 2
    when"else"
      $syn[i] = 3
    when"elsif"
      $syn[i] = 4
    when"do"
      $syn[i] = 5
    when"while"
      $syn[i] = 6
    when"return"
      $syn[i] = 7
    when"break"
      $syn[i] = 8
    when"int"
      $syn[i] = 9
    when"char"
      $syn[i] = 10
    when"real"
      $syn[i] = 38
    when"gets"
      $syn[i] = 40
    when"puts"
      $syn[i] = 42
    when "+", "*", "/", "=", "(", ")", ";", ","
      $syn[i] = $token[i][0] - 20
    when "[", "]"
      $syn[i] = $token[i][0] - 60
    when "{", "}"
      $syn[i] = $token[i][0] - 80
    when "%"
      $syn[i] = $token[i][0] - 10
    when ":="
      $syn[i] = 14
    when "!="
      $syn[i] = 15
    when"<=",">="
      $syn[i] = $token[i][0] - 20
    when"<", ">"
      $syn[i] = $token[i][0] - 30
    when'"'
      $syn[i] = 29
    else
      if $token[i][0].chr >= '0' && $token[i][0].chr <= '9'
        $syn[i] = 18
      elsif $token[i][0].chr == '_'
        $syn[i] = 17
      elsif $token[i][0].chr == '#'
        $syn[i] = 35
      elsif $token[i][0].chr == '-'
        if $token[i][1] == nil
          $syn[i] = $token[i][0] - 20
        else
          $syn[i] = 26
        end
      elsif $syn[i - 1] == 29
        $syn[i] = 19
      else
        $syn[i] = 16
      end
    end
  }
  
  0.upto($token.length - 1) { |i|  
    print $getNumofLine[i], "    "
    print $syn[i], "    "
    puts $token[i]
  }
end
