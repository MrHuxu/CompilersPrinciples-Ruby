# To change this template, choose Tools | Templates
# and open the template in the editor.
load "LexAnalyzer.rb"
load "StxAnalyzer.rb"
load "declareID.rb"

#输入文件路径，坑爹的gets方法，居然在最后有一个\n，注意第8行就是消除这个字符
LexAnalyzer()
StxAnalyzer()