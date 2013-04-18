# To change this template, choose Tools | Templates
# and open the template in the editor.
load "LexAnalyzer.rb"
load "StxAnalyzer.rb"
load "declareID.rb"

#输入文件路径，坑爹的gets方法，居然在最后有一个\n，注意第8行就是消除这个字符
LexAnalyzer()
Make_Stx_list()

j = 0
tmp = []
while j <= $sentence.length-1
  #行首为注释符，跳过此行不归约
  if $sentence[j] == '#'        
    j += 1
  #行首为if或while，必须将这行直到end之间的内容放进tmp里进行归于
  elsif $sentence[j] == 'f' || $sentence[j] == 'e'        
    j.upto($sentence.length-1) { |i|  
      if $sentence[i] == 'd'
        tmp = [] + $sentence[j..i] + ['$']
        tmp = tmp - ['#'] if tmp.include?('#')         #去掉注释内容
        StxAnalyzer(tmp, $getNumofLine[j], $getNumofLine[i])
        j = i + 1
        break
      end
    }
  #若行首为其他元素，则将该行放入tmp里进行归约
  else
    j.upto($sentence.length-1) { |i|  
      if $getNumofLine[j] != $getNumofLine[i]
        tmp = [] + $sentence[j..i-1] + ['$']
        tmp = tmp - ['#'] if tmp.include?('#')
        StxAnalyzer(tmp, $getNumofLine[j], nil)
        j = i
        break
      end
    }
  end
end