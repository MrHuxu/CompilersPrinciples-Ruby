# To change this template, choose Tools | Templates
# and open the template in the editor.
load "LexAnalyzer.rb"
load "StxAnalyzer.rb"
load "SyntoSentence.rb"
load "declareID.rb"

#输入文件路径，坑爹的gets方法，居然在最后有一个\n，注意第8行就是消除这个字符
LexAnalyzer()
SyntoSentence()
Make_Stx_list()

j = 0
tmp = []
continue = 0
while j <= $sentence.length-1
  if $sentence[j] == 'f' || $sentence[j] == 'e'
    j.upto($sentence.length-1) { |i|  
      if $sentence[i] == 'd'
        tmp = [] + $sentence[j..i]
        tmp[tmp.length] = '$'
        StxAnalyzer(tmp, $getNumofLine[j], $getNumofLine[i])
        j = i + 1
        break
      end
    }
  else
    j.upto($sentence.length-1) { |i|  
      if $getNumofLine[j] != $getNumofLine[i]
        tmp = [] + $sentence[j..i-1]
        tmp[tmp.length] = '$'
        StxAnalyzer(tmp, $getNumofLine[j], nil)
        j = i
        break
      end
    }
  end
end