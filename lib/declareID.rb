#一堆全局变量，后面都要用到
$syn = []         #种别码数组
$token = []         #属性值数组
$getNumofLine = []          #行号数组
$sentence = []        #将种别码转换成终结符后的数组
$V = []       #非终结符数组
$T = []       #终结符数组
$X = []       #取出S'、$后的数组
$Stx_list = []        #预测分析表，每一项都是一个散列表，散列表指向的又是一个数组
$pro_l = []         #项目集，是一个三维数组，第一维表示项目集序号，第二维表示产生式在项目集中的位置，第三维表示产生式元素位置
$line = []      #产生式数组
$first = []       #first集
$stack = []       #归约用的栈，话说Ruby实现栈真是超简单啊，m.insert[m.length],m.delete_at[m.length]
$pla = 0        #项目集数量
$numofpro = []        #各个项目集的产生式个数
$num = 1      #求闭包实给项目集产生式个数技术