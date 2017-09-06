/*
Navicat MySQL Data Transfer

Source Server         : alicloud
Source Server Version : 50637
Source Host           : www.gocoder.top:3306
Source Database       : teamwork

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2017-09-04 11:03:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `brief` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '摘要',
  `detail` text COMMENT '文章内容',
  `category` varchar(128) DEFAULT NULL COMMENT '分类',
  `access` varchar(32) DEFAULT NULL COMMENT '访问权限',
  `status` varchar(32) DEFAULT NULL COMMENT '状态：草稿、发布',
  `view_time` int(8) DEFAULT NULL COMMENT '阅读次数',
  `thumb_up_time` int(8) DEFAULT NULL COMMENT '点赞次数',
  `author_name` varchar(64) DEFAULT NULL COMMENT '创建者名称',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('A17083120222248', 'test关于比特币', '2008年爆发全球金融危机，当时有人用“  中本聪  ”的化名发          比特币  (2张)                    表了一篇论文，描述了比特币的模式。    和法定货币相比，比特币没有一个集中的发行方，而是由网络节点的计算生成，谁都有可能参与制造比特币，而且可以全世界流通，可以在任意一台接入互联网的电脑上买卖，不管身处何方，任何人都可以挖掘、购买、出售或收取比特币，并且在交易过程中外人无法辨认用户身份信息。  [2]    &nbsp;   2009年，不受央行和任何金融机构控制的比特币诞生。  [2]    &nbsp;   比特币是一种“  电子货币  ”，由...', '<div class=\"para\">2008年爆发全球金融危机，当时有人用“<a href=\"https://baike.baidu.com/item/%E4%B8%AD%E6%9C%AC%E8%81%AA\" target=\"_blank\">中本聪</a>”的化名发<a title=\"比特币\" class=\"lemma-album layout-right nslog:10000206\" style=\"width: 222px;\" href=\"https://baike.baidu.com/pic/%E6%AF%94%E7%89%B9%E5%B8%81/4143690/20461629/7c1ed21b0ef41bd5e47357ea53da81cb39db3d8f?fr=lemma&ct=cover\" target=\"_blank\"><div class=\"album-wrap\" style=\"width: 220px; height: 123px;\"><img class=\"picture\" alt=\"比特币\" src=\"/ueditor/jsp/upload/image/20170831/1504182129979064331.jpg\"/></div><div class=\"description\">比特币<span class=\"number\">(2张)</span> </div><div class=\"albumBg\"><div class=\"albumBgFir\" style=\"width: 214px;\"></div><div class=\"albumBgSec\" style=\"width: 208px;\"></div></div></a> 表了一篇论文，描述了比特币的模式。</div><div class=\"para\">和法定货币相比，比特币没有一个集中的发行方，而是由网络节点的计算生成，谁都有可能参与制造比特币，而且可以全世界流通，可以在任意一台接入互联网的电脑上买卖，不管身处何方，任何人都可以挖掘、购买、出售或收取比特币，并且在交易过程中外人无法辨认用户身份信息。<sup>[2]</sup><a class=\"sup-anchor\">&nbsp;</a> 2009年，不受央行和任何金融机构控制的比特币诞生。<sup>[2]</sup><a class=\"sup-anchor\">&nbsp;</a> 比特币是一种“<a href=\"https://baike.baidu.com/item/%E7%94%B5%E5%AD%90%E8%B4%A7%E5%B8%81\" target=\"_blank\">电子货币</a>”，由计算机生成的一串串复杂代码组成，新比特币通过预设的程序制造，随着比特币总量的增加，新币制造的速度减慢，直到2014年达到2100万个的总量上限，被挖出的比特币总量已经超过1200万个。<sup>[2]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">每当比特币进入主流媒体的视野时，主流媒体总会请一些主流经济学家分析一下比特币。早先，这些分析总是集中在比特币是不是骗局。而现如今的分析总是集中在比特币能否成为未来的主流货币。而这其中争论的焦点又往往集中在比特币的通缩特性上。<sup>[5]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">不少比特币玩家是被比特币的不能随意增发所吸引的。和比特币玩家的态度截然相反，经济学家们对比特币2100万固定总量的态度两极分化。<sup>[6]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\"><a href=\"https://baike.baidu.com/item/%E5%87%AF%E6%81%A9%E6%96%AF%E5%AD%A6%E6%B4%BE\" target=\"_blank\">凯恩斯学派</a>的经济学家们认为政府应该积极调控货币总量，用<a href=\"https://baike.baidu.com/item/%E8%B4%A7%E5%B8%81%E6%94%BF%E7%AD%96\" target=\"_blank\">货币政策</a>的松紧来为经济适时的加油或者刹车。因此，他们认为比特币固定总量货币牺牲了可调控性，而且更糟糕的是将不可避免地导致通货紧缩，进而伤害整体经济。<a href=\"https://baike.baidu.com/item/%E5%A5%A5%E5%9C%B0%E5%88%A9%E5%AD%A6%E6%B4%BE\" target=\"_blank\">奥地利学派</a>经济学家们的观点却截然相反，他们认为政府对货币的干预越少越好，货币总量的固定导致的通缩并没什么大不了的，甚至是社会进步的标志。</div><div class=\"para\">比特币网络通过“挖矿”来生成新的比特币。所谓“挖矿”实质上是用计算机解决一项复杂的数学问题，来保证比特币网络分布式记账系统的一致性。比特币网络会自动调整数学问题的难度，让整个网络约每10分钟得到一个合格答案。随后比特币网络会新生成一定量的比特币作为赏金，奖励获得答案的人。</div><div class=\"para\">2009年比特币诞生的时候，每笔赏金是50个比特币。诞生10分钟后，第一批50个比特币生成了，而此时的货币总量就是50。随后比特币就以约每10分钟50个的速度增长。当总量达到1050万时(2100万的50%)，赏金减半为25个。当总量达到1575万(新产出525万，即1050的50%)时，赏金再减半为12.5个。<sup>[7]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">首先，根据其设计原理，比特币的总量会持续增长，直至100多年后达到2100万的那一天。但比特币货币总量后期增长的速度会非常缓慢。事实上，87.5%的比特币都将在头12年内被“挖”出来。所以从货币总量上看，比特币并不会达到固定量，其货币总量实质上是会不断膨胀的，尽管速度越来越慢。因此看起来比特币似乎是通胀货币才对。</div><div class=\"para\">然而判断处于通货紧缩还是膨胀，并不依据货币总量是减少还是增多，而是看整体物价水平是下跌还是上涨。整体物价上升即为通货膨胀，反之则为通货紧缩。长期看来，比特币的发行机制决定了它的货币总量增长速度将远低于社会财富的增长速度。</div><div class=\"para\">凯恩斯学派的经济学家们认为，物价持续下跌会让人们倾向于推迟消费，因为同样一块钱明天就能买到更多的东西。消费意愿的降低又进一步导致了需求萎缩、商品滞销，使物价变得更低，步入“通缩螺旋”的恶性循环。同样，通缩货币哪怕不存入银行本身也能升值（购买力越来越强），人们的投资意愿也会升高，社会生产也会陷入低迷。<sup>[5]</sup><a class=\"sup-anchor\">&nbsp;</a> 因此比特币是一种具备通缩倾向的货币。比特币经济体中，以比特币定价的商品价格将会持续下跌。<sup>[1]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">比特币是一种网络虚拟货币，数量有限，但是可以用来套现：可以兑换成大多数国家的货币。你可以使用比特币购买一些虚拟的物品，比如网络游戏当中的衣服、帽子、装备等，只要有人接受，你也可以使用比特币购买现实生活当中的物品。<sup>[1]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">2014年9月9日，美国电商巨头<a href=\"https://baike.baidu.com/item/eBay\" target=\"_blank\">eBay</a>宣布，该公司旗下支付处理子公司Braintree将开始接受比特币支付。该公司已与比特币交易平台Coinbase达成合作，开始接受这种相对较新的支付手段。</div><div class=\"para\">虽然eBay市场交易平台和PayPal业务还不接受比特币支付，但旅行房屋租赁社区<a href=\"https://baike.baidu.com/item/Airbnb\" target=\"_blank\">Airbnb</a>和租车服务<a href=\"https://baike.baidu.com/item/Uber/14900884\" target=\"_blank\">Uber</a>等Braintree客户将可开始接受这种虚拟货币。Braintree的主要业务是面向企业提供支付处理软件，该公司在去年被eBay以大约8亿美元的价格收购。</div><div class=\"para\">2017年1月22日晚间，火币网、比特币中国与OKCoin币行相继在各自官网发布公告称，为进一步抑制投机，防止价格剧烈波动，各平台将于2017年1月24日中午12：00起开始收取交易服务费，服务费按成交金额的0.2%固定费率收取，且主动成交和被动成交费率一致。<sup>[4]</sup><a class=\"sup-anchor\">&nbsp;</a> 5月5日，OKCoin币行网的最新数据显示，比特币的价格刚刚再度刷新历史，截止发稿前最高触及9222点高位。<sup>[8]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-2\"><h2 class=\"title-text\"><span class=\"title-prefix\">比特币</span>创始人物</h2></div><div class=\"para\"><div class=\"lemma-picture text-pic layout-right\" style=\"width: 220px; float: right;\"><a title=\"京都大学数学教授望月新一\" class=\"image-link\" style=\"width: 220px; height: 147px;\" href=\"https://baike.baidu.com/pic/%E6%AF%94%E7%89%B9%E5%B8%81/4143690/0/024f78f0f736afc3db3f5ed0b119ebc4b7451257?fr=lemma&ct=single\" target=\"_blank\"><img alt=\"京都大学数学教授望月新一\" src=\"/ueditor/jsp/upload/image/20170831/1504182130160074800.jpg\"/></a><span class=\"description\">京都大学数学教授望月新一 </span></div>2008年11月1日，一个自称中本聪（Satoshi Nakamoto）的人在一个隐秘的<a href=\"https://baike.baidu.com/item/%E5%AF%86%E7%A0%81%E5%AD%A6\" target=\"_blank\">密码学</a>评论组上贴出了一篇研讨陈述，陈述了他对电子货币的新设想——比特币就此面世，比特币的首笔交易完成。比特币用揭露散布总账摆脱了第三方机构的制约，中本聪称之为“区域链”。用户乐于奉献出<a href=\"https://baike.baidu.com/item/CPU\" target=\"_blank\">CPU</a>的运算能力，运转一个特别的软件来做一名“挖矿工”，这会构成一个网络共同来保持“区域链”。这个过程中，他们也会生成新货币。买卖也在这个网络上延伸，运转这个软件的电脑真相破解不可逆暗码难题，这些难题包含好几个买卖数据。第一个处理难题的“<a href=\"https://baike.baidu.com/item/%E7%9F%BF%E5%B7%A5\" target=\"_blank\">矿工</a>”会得到50比特币奖赏，相关买卖区域加入链条。跟着“矿工”数量的添加，每个迷题的艰难程度也随之进步，这使每个买卖区的比特币生产率保持约在10分钟一枚。</div><div class=\"para\">2009年，中本聪设计出了一种数字货币，即比特币，风风火火的比特币市场起了又落，而其创始人“中本聪”的身份一直都是个谜，关于“比特币之父”的传闻牵涉到从美国国家安全局到金融专家，也给比特币罩上了神秘光环。</div><div class=\"para\">据外媒报道称，计算机科学家TedNelson周日在网络上发布视频称，他已经确定出，比特币的创始人是京都大学数学教授望月新一（ShinichiMochizuki）。比特币的创始人一直以来使用的都是中本聪（SatoshiNakamoto）的假名，互联网领域也对其真实身份展开了大量推测。纳尔逊发布视频称，他已确定望月新一就是比特币的真正创始人。<sup>[9]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">望月新一2013年因为证明ABC猜想而名声大噪。他高中时就读于菲利普埃克塞特学院，后者是美国最具声望的高中之一，仅仅两年后就毕业。望月新一16岁进入美国普林斯顿大学，22岁时以博士身份离校，33岁就成为正教授，这么年轻就获得正教授职称在学术界极为罕见。这个数学界的巨星可能已经攻破了该领域最为重要的难题之一。</div><div class=\"para\">中本聪本人在互联网上留下的个人资料很少，尤其是近几年几乎完全销声匿迹，因此其身世也变成了一个迷。2014年3月7日，当比特币创始人多利安·P·中本聪被找到的新闻传出后，迅速成为互联网上最吸引人的消息。</div><div class=\"para\">与外界揣测其可能是个虚构的名字不同，“中本聪”是个真实的名字，他是一名64岁的日裔美国人，他喜欢收集火车模型，曾供职大企业和美国军方，从事机密工作。在过去的40年中，中本聪从不在生活中用他的真名。根据美国洛杉矶地方法院1973年的档案，在他23岁从加州州立理工大学毕业时，将自己的名字改为了多利安·普伦蒂斯·中本聪（DorianPrenticeSatoshiNakamoto）。从那时起，他不再使用“聪”这个名字，而用多利安·中本S（DorianS.Nakamoto）作为签名。<sup>[9]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-2\"><h2 class=\"title-text\"><span class=\"title-prefix\">比特币</span>产生原理</h2></div><div class=\"para\">从比特币的本质说起，比<div class=\"lemma-picture text-pic layout-right\" style=\"width: 250px; float: right;\"><a title=\"疯狂涨势\" class=\"image-link\" style=\"width: 250px; height: 106px;\" href=\"https://baike.baidu.com/pic/%E6%AF%94%E7%89%B9%E5%B8%81/4143690/0/d043ad4bd11373f093fb8183a60f4bfbfaed04e1?fr=lemma&ct=single\" target=\"_blank\"><img alt=\"疯狂涨势\" src=\"/ueditor/jsp/upload/image/20170831/1504182130204024393.jpg\"/></a><span class=\"description\">疯狂涨势 </span></div>特币的本质其实就是一堆复杂算法所生成的特解。特解是指<a href=\"https://baike.baidu.com/item/%E6%96%B9%E7%A8%8B%E7%BB%84\" target=\"_blank\">方程组</a>所能得到无限个（其实比特币是有限个）解中的一组。而每一个特解都能解开方程并且是唯一的。<sup>[10]</sup><a class=\"sup-anchor\">&nbsp;</a> 以人民币来比喻的话，比特币就是人民币的序列号，你知道了某张钞票上的序列号，你就拥有了这张钞票。而挖矿的过程就是通过庞大的计算量不断的去寻求这个方程组的特解，这个方程组被设计成了只有 2100 万个特解，所以比特币的上限就是 2100 万。<sup>[10]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">要挖掘比特币可以下载专用的比特币运算工具，然后注册各种合作网站，把注册来的用户名和密码填入计算程序中，再点击运算就正式开始。<sup>[11]</sup><a class=\"sup-anchor\">&nbsp;</a> 完成Bitcoin客户端安装后，可以直接获得一个Bitcoin地址，当别人付钱的时候，只需要自己把地址贴给别人，就能通过同样的客户端进行付款。在安装好比特币客户端后，它将会分配一个私有<a href=\"https://baike.baidu.com/item/%E5%AF%86%E9%92%A5\" target=\"_blank\">密钥</a>和一个<a href=\"https://baike.baidu.com/item/%E5%85%AC%E5%BC%80%E5%AF%86%E9%92%A5\" target=\"_blank\">公开密钥</a>。需要备份你包含私有密钥的钱包数据，才能保证财产不丢失。如果不幸完全格式化硬盘，个人的比特币将会完全丢失。</div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-2\"><h2 class=\"title-text\"><span class=\"title-prefix\">比特币</span>货币特征</h2></div><div class=\"para\"><strong>去中心化：</strong>比特币是第一种分布式的虚拟货币，整个网络由用户构成，没有中央银行。去中心化是比特币安全与自由的保证 。</div><div class=\"para\"><strong>全世界流通：</strong>比特币可以在任意一台接入互联网的电脑上管理。不管身处何方，任何人都可以挖掘、购买、出售或收取比特币。</div><div class=\"para\"><strong>专属所有权：</strong>操控比特币需要私钥，它可以被隔离保存在任何存储介质。除了用户自己之外无人可以获取。</div><div class=\"para\"><strong>低交易费用：</strong>可以免费汇出比特币，但最终对每笔交易将收取约1比特分的交易费以确保交易更快执行。</div><div class=\"para\"><strong>无隐藏成本：</strong>作为由A到B的支付手段，比特币没有繁琐的额度与手续限制。知道对方比特币地址就可以进行支付。</div><div class=\"para\"><strong>跨平台挖掘：</strong>用户可以在众多平台上发掘不同硬件的计算能力。</div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-3\"><h3 class=\"title-text\"><span class=\"title-prefix\">比特币</span>优点</h3></div><ol class=\"custom_num  para-list list-paddingleft-1\"><li class=\"list-num-1-1 list-num-paddingleft-1\"><div class=\"para\">完全去处中心化，没有发行机构，也就不可能操纵发行数量。其发行与流通，是通过开源的p2p算法实现。</div></li><li class=\"list-num-1-2 list-num-paddingleft-1\"><div class=\"para\">匿名、免税、免监管。</div></li><li class=\"list-num-1-3 list-num-paddingleft-1\"><div class=\"para\">健壮性。比特币完全依赖p2p网络，无发行中心，所以外部无法关闭它。比特币价格可能波动、崩盘，多国政府可能宣布它非法，但比特币和比特币庞大的p2p网络不会消失。</div></li><li class=\"list-num-1-4 list-num-paddingleft-1\"><div class=\"para\">无国界、跨境。跨国汇款，会经过层层外汇管制机构，而且交易记录会被多方记录在案。但如果用比特币交易，直接输入数字地址，点一下鼠标，等待p2p网络确认交易后，大量资金就过去了。不经过任何管控机构，也不会留下任何跨境交易记录。</div></li><li class=\"list-num-1-5 list-num-paddingleft-1\"><div class=\"para\">山寨者难于生存。由于比特币算法是完全开源的，谁都可以下载到源码，修改些参数，重新编译下，就能创造一种新的p2p货币。但这些山寨货币很脆弱，极易遭到51%攻击。任何个人或组织，只要控制一种p2p货币网络51%的运算能力，就可以随意操纵交易、币值，这会对p2p货币构成毁灭性打击。很多山寨币，就是死在了这一环节上。而比特币网络已经足够健壮，想要控制比特币网络51%的运算力，所需要的cpu/gpu数量将是一个天文数字。</div></li></ol><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-3\"><h3 class=\"title-text\"><span class=\"title-prefix\">比特币</span>缺点</h3></div><ol class=\"custom_num  para-list list-paddingleft-1\"><li class=\"list-num-1-1 list-num-paddingleft-1\"><div class=\"para\">交易平台的脆弱性。比特币网络很健壮，但比特币交易平台很脆弱。交易平台通常是一个网站，而网站会遭到黑客攻击，或者遭到主管部门的关闭。</div></li><li class=\"list-num-1-2 list-num-paddingleft-1\"><div class=\"para\">交易确认时间长。比特币钱包初次安装时，会消耗大量时间下载历史交易数据块。而比特币交易时，为了确认数据准确性，会消耗一些时间，与p2p网络进行交互，得到全网确认后，交易才算完成。</div></li><li class=\"list-num-1-3 list-num-paddingleft-1\"><div class=\"para\">价格波动极大。由于大量炒家介入，导致比特币兑换现金的价格如过山车一般起伏。使得比特币更适合投机，而不是匿名交易。</div></li><li class=\"list-num-1-4 list-num-paddingleft-1\"><div class=\"para\">大众对原理不理解，以及传统金融从业人员的抵制。活跃网民了解p2p网络的原理，知道比特币无法人为操纵和控制。但大众并不理解，很多人甚至无法分清比特币和Q币的区别。“没有发行者”是比特币的优点，但在传统金融从业人员看来，“没有发行者”的货币毫无价值。<sup>[12]</sup><a class=\"sup-anchor\">&nbsp;</a></div></li></ol><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-2\"><h2 class=\"title-text\"><span class=\"title-prefix\">比特币</span>货币交易</h2></div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-3\"><h3 class=\"title-text\"><span class=\"title-prefix\">比特币</span>购买方法</h3></div><div class=\"para\"><div class=\"lemma-picture text-pic layout-right\" style=\"width: 220px; float: right;\"><a title=\"\" class=\"image-link\" style=\"width: 220px; height: 150px;\" href=\"https://baike.baidu.com/pic/%E6%AF%94%E7%89%B9%E5%B8%81/4143690/0/0eb30f2442a7d933108ec115ac4bd11373f001b5?fr=lemma&ct=single\" target=\"_blank\"><img alt=\"\" src=\"/ueditor/jsp/upload/image/20170831/1504182130383038535.jpg\"/></a></div>用户可以买到比特币，同时还可以使用计算机依照算法进行大量的运算来“开采”比特币。在用户“开采”比特币时，需要用电脑搜寻<a href=\"https://baike.baidu.com/item/64%E4%BD%8D\" target=\"_blank\">64位</a>的数字就行，然后通过反复解谜密与其他淘金者相互竞争，为比特币网络提供所需的数字，如果用户的电脑成功地创造出一组数字，那么就将会获得25个比特币。</div><div class=\"para\">由于比特币系统采用了分散化编程，所以在每10分钟内只能获得25个比特币，而到2140年，流通的比特币上限将会达到2100万。换句话说，比特币系统是能够实现自给自足的，通过<a href=\"https://baike.baidu.com/item/%E7%BC%96%E7%A0%81\" target=\"_blank\">编码</a>来抵御通胀，并防止他人对这些代码进行破坏。</div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-3\"><h3 class=\"title-text\"><span class=\"title-prefix\">比特币</span>交易方式</h3></div><div class=\"para\">比特币是类似电子邮件的电子现金，交易双方需要类似电子邮箱的“比特币钱包”和类似电邮地址的“比特币地址”。和收发电子邮件一样，汇款方通过电脑或智能手机，按收款方地址将比特币直接付给对方。下列表格，列出了免费下载比特币钱包和地址的部分网站。</div><div class=\"para\">比特币地址是大约33位长的、由字母和数字构成的一串字符，总是由1或者3开头，例如&quot;1DwunA9otZZQyhkVvkLJ8DV1tuSwMF7r3v&quot;。比特币软件可以自动生成地址，生成地址时也不需要联网交换信息，可以离线进行[2]。可用的比特币地址超过2个。形象地说，全世界约有2粒沙， 如果每一粒沙中有一个地球，那么比特币地址总数远远超过所有这些“地球”上的所有的沙子的数量。</div><div class=\"para\">比特币地址和私钥是成对出现的，他们的关系就像银行卡号和密码。比特币地址就像银行卡号一样用来记录你在该地址上存有多少比特币。你可以随意的生成比特币地址来存放比特币。每个比特币地址在生成时，都会有一个相对应的该地址的私钥被生成出来。这个私钥可以证明你对该地址上的比特币具有所有权。我们可以简单的把比特币地址理解成为银行卡号，该地址的私钥理解成为所对应银行卡号的密码。只有你在知道银行密码的情况下才能使用银行卡号上的钱。所以，在使用比特币钱包时请保存好你的地址和私钥。</div><div class=\"para\">比特币的交易数据被打包到一个“数据块”或“区块”（block）中后，交易就算初步确认了。当区块链接到前一个区块之后，交易会得到进一步的确认。在连续得到6个区块确认之后，这笔交易基本上就不可逆转地得到确认了。比特币对等网络将所有的交易历史都储存在“区块链”（blockchain）中。区块链在持续延长，而且新区块一旦加入到区块链中，就不会再被移走。区块链实际上是一群分散的用户端节点，并由所有参与者组成的<a href=\"https://baike.baidu.com/item/%E5%88%86%E5%B8%83%E5%BC%8F%E6%95%B0%E6%8D%AE%E5%BA%93\" target=\"_blank\">分布式数据库</a>，是对所有比特币交易历史的记录 。 中本聪预计，当数据量增大之后，用户端希望这些数据并不全部储存自己的节点中。为了实现这一目标，他采用引入<a href=\"https://baike.baidu.com/item/%E6%95%A3%E5%88%97%E5%87%BD%E6%95%B0\" target=\"_blank\">散列函数</a>机制。这样用户端将能够自动剔除掉那些自己永远用不到的部分，比方说极为早期的一些比特币交易记录。</div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-3\"><h3 class=\"title-text\"><span class=\"title-prefix\">比特币</span>消费方式</h3></div><div class=\"para\">许多面向科技玩家的网站，已经开始接受比特币交易。包括Mtgox，BTCChina之类的网站，以及淘宝某些商店，甚至能接受比特币兑换美元、欧元等服务。毫无疑问，比特币已经成为真正的流通货币，而非腾讯Q币那样的虚拟货币。国外已经有专门的比特币第三方支付公司，类似国内的支付宝，可以提供API接口服务。</div><div class=\"para\">可以用钱来买比特币，也可以当采矿者，“开采”它们用电脑搜寻64位的数字就行。通过用电脑反复解密，与其他的淘金者竞争，为比特币网络提供所需的数字。如果电脑能够成功地创造出一组数字，就会获得25个比特币。比特币是分散化的，需要在每个单位计算时间内创造固定数量比特币是每10分钟内可获得25个比特币。到2140年，流通的比特币上限将达到2100万。换句话说，比特币体制是可以自给自足的，译成编码可抵御通胀，防止他人搞破坏。</div><div class=\"anchor-list\"><a class=\"lemma-anchor para-title\"></a> <a class=\"lemma-anchor \"></a> <a class=\"lemma-anchor \"></a> </div><div class=\"para-title level-3\"><h3 class=\"title-text\"><span class=\"title-prefix\">比特币</span>支付案例</h3></div><div class=\"para\">在被投资者疯狂追逐的同时，比特币已经在现实中被个别商家接受。北京一家餐馆开启了比特币支付。这家位于朝阳大悦城的餐馆称，该店从2013年11月底开始接受比特币支付。消费者在用餐结束时，把一定数量的比特币转账到该店账户，即可完成支付，整个过程类似于银行转账。该餐馆曾以0.13个比特币结算了一笔650元的餐费。<sup>[13]</sup><a class=\"sup-anchor\">&nbsp;</a> </div><div class=\"para\">2014年1月，Overstock开始接受比特币，成为首家接受比特币的大型网络零售商。</div><p><br/></p>', 'DS2600,Java,IOS,JavaWeb', 'private', 'publish', '4', '0', '丁庆发', 'dingqingfa@star-net.cn', '2017-08-31 20:22:23', 'dingqingfa@star-net.cn', '2017-08-31 20:22:23', '0');
INSERT INTO `article` VALUES ('A17090116254132', 'ioctl无法正常执行（android64位系统上运行32位应用的兼容问题）', '问题一：ioctl未被调用到      背景：在64位安卓系统上运行32位应用程序，调用ioctl时，对应驱动没有运行ioctl    原因：针对上述背景的情况，ioctl调用的实际上是驱动中的compat_ioctl 接口，需要我们增加该定义（如果增加完该接口定义仍然没有调用到，尝试开启配置，  在device/nb/la68/ProjectConfig.mk（根据各人实际项目进入对应目录）下增加CONFIG_COMPAT = yes；），  驱动中增加compat_ioctl的定义，与unlocked_ioctl一样的定义方法    const struct file_operat...', '<div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"font-size: 18px; font-weight: bold;\">问题一：ioctl未被调用到</span></div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">背景：在64位安卓系统上运行32位应用程序，调用ioctl时，对应驱动没有运行ioctl</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">原因：针对上述背景的情况，ioctl调用的实际上是驱动中的compat_ioctl 接口，需要我们增加该定义（如果增加完该接口定义仍然没有调用到，尝试开启配置，<span style=\"color: rgb(72, 71, 68); background-color: rgb(255, 255, 255);\">在device/nb/la68/ProjectConfig.mk（根据各人实际项目进入对应目录）下增加CONFIG_COMPAT = yes；），</span>驱动中增加compat_ioctl的定义，与unlocked_ioctl一样的定义方法</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">const struct file_operations stm32f103_fops = {</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.owner = THIS_MODULE,</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;	.poll = stm32f103_poll,</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.open = stm32f103_open,</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.read = stm32f103_read_buff,</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.write = stm32f103_write_buff,</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.release = stm32f103_release,</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.unlocked_ioctl = stm32f103_unlocked_ioctl,	</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	.compat_ioctl = stm32f103_compat_ioctl, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //32位应用运行在64位系统时ioctl调用该接口</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">};</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"font-size: 18px; font-weight: bold;\">问题二：ioctl中调用copy_from_user时出错，提示地址有问题</span></div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">背景：</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">由于ioctl第三个参数，我在应用层中传入的是一个指向结构体的指针（该指针已由系统转换为64位指针，可以访问到用户空间的数据），且该结构体中含有指针成员，而指针在32位环境下为4位长度，在64位环境下为8位长度，同一个结构体，在不同的环境下，由于内存对齐，导致两个结构体实际的空间占用是不同的，在驱动中接收到该结构体后，进行数据处理需要注意结构体内存对齐问题，尤其是指针和long类型的数据要进行转换。</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">原结构体如下：</p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;typedef struct</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;{</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;	char data_len;</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;	char *data_buff;</div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;}stm32_data_pack_t;</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><br/></p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">在驱动中增加定义了中间结构体，如下：</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;typedef struct</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;{</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;	char data_len;</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;	int data_buff;</div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;}stm32_data_pack_32bit_t;</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">转换方法：</p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">在驱动中（64位环境）用int先存储传进来的32位环境下的4位长度char*，然后利用compat_ptr函数将32位地址转换为64位地址，这样得到的地址就可以拿来访问用户空间的数据了</div><br/><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><br/></p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">具体代码片段如下（参数arg为32位应用程序传进来的指向结构体的指针，该指针已由系统转换为64位环境下的地址）：</p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">long stm32f103_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">{</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	stm32_data_pack_t data_pack;</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp; &nbsp;&nbsp;	stm32_data_pack_32bit_t &nbsp;data_pack_32bit;</div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">	memset(&amp;data_pack_32bit, 0, sizeof(stm32_data_pack_32bit_t));</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><br/></p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp; &nbsp; &nbsp;ret = copy_from_user(&amp;data_pack_32bit, (stm32_data_pack_32bit_t *)arg, sizeof(stm32_data_pack_32bit_t));</div><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp; &nbsp; &nbsp;data_pack.data_len = data_pack_32bit.data_len;</div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp; &nbsp; &nbsp;data_pack.data_buff= compat_ptr(data_pack_32bit.data_buff);</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><br/></p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;return ret；</div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\">}</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"font-size: 14px; line-height: 24.5px; white-space: pre-wrap;\"></span><span style=\"font-size: 14px; line-height: 24.5px; white-space: pre-wrap;\">这里转换后的<span style=\"font-size: 14px; line-height: 24.5px; white-space: pre-wrap;\">data_pack.data_buff</span>是用户空间地址，需要调用相关接口（eg：<span style=\"font-size: 14px; line-height: 24.5px; white-space: pre-wrap;\">copy_from_user</span>）从用户空间地址拷贝到内核态地址来，才能处理数据。</span>	</p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"></p><div style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><span style=\"font-size: 18px; font-weight: bold;\">三、总结：</span></div><div style=\"white-space: pre-wrap; line-height: 1.75; text-indent: 28px; font-size: 14px;\"><span style=\"font-size: 18px; font-weight: bold;\">32位应用传入64位底层的数据要尽量避免开数据类型不兼容的类型，比如指针、long等，尤其是结构体需要格外注意，涉及到内存对齐问题。</span></div><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><br/></p><p style=\"white-space: pre-wrap; line-height: 1.75; font-size: 14px;\"><br/></p><p><br/></p>', 'DS3000,Linux,Android', 'public', 'publish', '14', '5', '黄文文', 'huangwenwen@star-net.cn', '2017-09-01 16:25:42', 'huangwenwen@star-net.cn', '2017-09-01 16:47:26', '0');
INSERT INTO `article` VALUES ('A17090116330647', 'flash 替换', '#### 一、概况及进展          由于原来使用的flash停产，需要在ds2600导入新flash。目前主要通过宇芯的黄工(huangshf&lt;huangshf@worldchip.cn&gt;)与全志协调来调试flash补丁，    计划导入的三款flash的计划及进入如下：          1. GD5F1GQ4UCYIG      	  - 调通补丁 （已完成）      	  - 使用x66测试验证 (已完成)      	  - x66小批量生产验证 (待生产)          2. W25N01GV(华邦)      	  - 补丁调试 (全志的提供的补丁无法...', '<p>#### 一、概况及进展</p><p><br/></p><p>由于原来使用的flash停产，需要在ds2600导入新flash。目前主要通过宇芯的黄工(huangshf&lt;huangshf@worldchip.cn&gt;)与全志协调来调试flash补丁，</p><p>计划导入的三款flash的计划及进入如下：</p><p><br/></p><p>1. GD5F1GQ4UCYIG</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- 调通补丁 （已完成）</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- 使用x66测试验证 (已完成)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- x66小批量生产验证 (待生产)</p><p><br/></p><p>2. W25N01GV(华邦)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- 补丁调试 (全志的提供的补丁无法兼容gd flash，需要找原厂更新新补丁)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- 使用x66测试验证 (未做)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- x66小批量 (未做)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span></p><p>3. PN26G01A (芯天下)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- 补丁调试 (芯片已寄出，大概1~2周可以全志可以调试完毕)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- 使用x66测试验证 (未做)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- x66小批量 (未做)</p><p>备注：以前的芯片叫万宏（音是这么发的），具体型号问罗工</p><p>&gt; 各款flash的规格信息见datasheet目录</p><p>备注：接下来黄工会提供一个通用的补丁包，支持这三款flash，需要验证三款设备和以前的flash设备</p><p><br/></p><p>#### 二、补丁使用方式</p><p><br/></p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>1. 将全志给的补丁文件同步到sdk (GD flash的补丁已经同步到develop分支39203678b8c1)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>2. 执行mkuboot -&gt; mkall进行编译&nbsp;</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>3. 查看kmsg的uboot版本是否有更新(如:uboot:nand version: 2 29 20170622 1145)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>备注：开机时候，查看串口信息 uboot:nand version: 2 32 20170728 1145</p><p>#### 三、测试包打包方式</p><p><br/></p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>发布新测试包时可能只希望替换底层flash相关的改动，这种情况下可使用固件包修改工具对固件包进行修改(ds2600-sdk/lichee/tools/pack/dvp/full_image_parser)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>具体步骤如下:</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>1. 在full_image_parser目录下运行&quot;unpack_full_img.sh + 要修改的固件&quot;，之后会在unpack_out目录生成解包内容。</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>2. 使用最新编译生成的fex文件(位于ds2600-sdk/lichee/tools/pack/out)替换原flash相关文件：</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>1. 替换unpack_out目录下的&quot;u-boot.fex、boot.fex、Vboot.fex、boot0_spinor.fex、boot0_spinand.fex、boot0_sdcard.fex&quot;</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>2. 替换origin目录下的&quot;u-boot-spinor.fex&quot;。</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">			</span>备注：(拷贝&quot;u-boot-spinor.fex&quot;到&quot;origin_files&quot;目录下)</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>3. 修改软件版本，修改unpack_out/rootfs/etc/dvp/sw_cfg/sw_ver.ini文件中的软件版本及日期，软件版本可以改为最新补丁提交后的commit号。</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>备注：取前5位（如 39203678b8c1 取 39203）</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>3. 执行pack_full_img.sh ./unpack_out来重新打包，之后会在packout目录下生成最新的固件（sun8iw8p1_camdroid_tiger-dvp-nand_uart0.img）。</p><p><br/></p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>有时需要修改网络固件升级包中flash相关的内容，步骤如下：</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>1.解包，需要将固件升级包中的如下几个文件进行替换:</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>- u-boot.fex及boot.fex可以用最新编译生成的fex进行替换，同固件包替换方式相同</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>2.然后修改rootfs目录下etc/dvp/sw_cfg/sw_ver.ini的commit号</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>3.重新打包</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>具体的ota解包及打包方法见ds2600-sdk/lichee/tools/pack/dvp/ota_parser内的README.md</p><p>备注：需要用root 用户操作（普通用户不知道哪里缺少了权限）</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span> &nbsp;操作前需要 source下</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span> &nbsp;不同版本的都需要mkall一下（boot.fex包含版本信息等 ），mkuboot只需要一次</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span></p><p>#### 四、验证方式</p><p><br/></p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>1. 让测试部用新包过下基本功能看是否正常。</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>2. 使用工具进行读写压力测试，看是否异常log输出。(压力测试工具及方法见&quot;压力测试/spinand_test&quot;目录）</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>备注：一般测试时间为两天</p><p><br/></p><p>#### 五、其他</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>还有5台x30,及若干flash样片在全志那边，等flash调试完成之后需要他们将机器寄回来</p><p><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>备注：设备寄给了全志，我们找 宇兴 黄工中间人来归还设备，1台在罗工名下，4台在33名下</p><p>#### 相关联系人</p><p><br/></p><p>宇兴-黄工:<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>huangshf@worldchip.cn</p><p>硬件-罗诚:<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>luocheng@star-net.cn</p><p><br/></p>', 'DS2600', 'private', 'publish', '12', '6', '李晴', 'liqing@star-net.cn', '2017-09-01 16:33:06', 'liqing@star-net.cn', '2017-09-01 16:33:06', '0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `category` varchar(32) DEFAULT NULL COMMENT '类型',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '所属',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('150327840738', 'task', 'T17072111340965', '456789', 'chenzhong.sy@star-net.cn', '2017-08-21 09:20:08', 'chenzhong.sy@star-net.cn', '2017-08-21 09:20:08', '1');
INSERT INTO `comment` VALUES ('150328346498', 'task', 'T17081614174204', '9999', 'chenzhong.sy@star-net.cn', '2017-08-21 10:44:25', 'chenzhong.sy@star-net.cn', '2017-08-21 10:44:25', '1');
INSERT INTO `comment` VALUES ('150328354240', 'task', 'T17081614174204', '12456', 'chenzhong.sy@star-net.cn', '2017-08-21 10:45:42', 'chenzhong.sy@star-net.cn', '2017-08-21 10:45:42', '1');
INSERT INTO `comment` VALUES ('150328382070', 'task', 'T17081614174204', '333333', 'chenzhong.sy@star-net.cn', '2017-08-21 10:50:21', 'chenzhong.sy@star-net.cn', '2017-08-21 10:50:21', '1');
INSERT INTO `comment` VALUES ('150328445045', 'task', 'T17081614174204', '123456', 'chenzhong.sy@star-net.cn', '2017-08-21 11:00:50', 'chenzhong.sy@star-net.cn', '2017-08-21 11:00:50', '1');
INSERT INTO `comment` VALUES ('150328469519', 'task', 'T17072111340965', '可怜', 'chenzhong.sy@star-net.cn', '2017-08-21 11:04:55', 'chenzhong.sy@star-net.cn', '2017-08-21 11:04:55', '1');
INSERT INTO `comment` VALUES ('150328472200', 'task', 'T17080215071754', '可怜', 'chenzhong.sy@star-net.cn', '2017-08-21 11:05:22', 'chenzhong.sy@star-net.cn', '2017-08-22 13:48:07', '1');
INSERT INTO `comment` VALUES ('150328478190', 'task', 'T17080215071754', '002396', 'chenzhong.sy@star-net.cn', '2017-08-21 11:06:21', 'chenzhong.sy@star-net.cn', '2017-08-21 16:55:55', '1');
INSERT INTO `comment` VALUES ('150328480313', 'task', 'T17080215071754', '10086', 'chenzhong.sy@star-net.cn', '2017-08-21 11:06:43', 'chenzhong.sy@star-net.cn', '2017-08-21 16:55:55', '1');
INSERT INTO `comment` VALUES ('150328589869', 'task', 'T17080215071754', 'ABCD', 'chenzhong.sy@star-net.cn', '2017-08-21 11:24:59', 'chenzhong.sy@star-net.cn', '2017-08-21 16:55:54', '1');
INSERT INTO `comment` VALUES ('150328618928', 'task', 'T17072111340965', '我来了', 'dingqingfa@star-net.cn', '2017-08-21 11:29:49', 'dingqingfa@star-net.cn', '2017-08-21 11:29:49', '1');
INSERT INTO `comment` VALUES ('150328621766', 'task', 'T17081614174204', '搞啥子<br />', 'dingqingfa@star-net.cn', '2017-08-21 11:30:17', 'dingqingfa@star-net.cn', '2017-08-21 11:30:17', '1');
INSERT INTO `comment` VALUES ('150328622447', 'task', 'T17081614174204', '搞啥子', 'dingqingfa@star-net.cn', '2017-08-21 11:30:25', 'dingqingfa@star-net.cn', '2017-08-21 11:30:25', '1');
INSERT INTO `comment` VALUES ('150328623004', 'task', 'T17081614174204', '搞啥子<br />', 'dingqingfa@star-net.cn', '2017-08-21 11:30:30', 'dingqingfa@star-net.cn', '2017-08-21 11:30:30', '1');
INSERT INTO `comment` VALUES ('150328639687', 'task', 'T17072111340965', '还要多久；\n我才能在你身边；', 'dingqingfa@star-net.cn', '2017-08-21 11:33:16', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:30', '1');
INSERT INTO `comment` VALUES ('150328643210', 'task', 'T17072111340965', '好不容易；\n又能再多爱一天；\n说了拜拜。', 'dingqingfa@star-net.cn', '2017-08-21 11:33:53', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:29', '1');
INSERT INTO `comment` VALUES ('150328646714', 'task', 'T17072111340965', '我怎么看不见。<br />没想到；<br />我还流着泪。', 'dingqingfa@star-net.cn', '2017-08-21 11:34:27', 'chenzhong.sy@star-net.cn', '2017-08-22 17:53:06', '1');
INSERT INTO `comment` VALUES ('150329484087', 'task', 'T17082113454481', 'c:if 标签多条件判断；<br /><c:if test=\"${fn:contains(task.assignTo, user.email) and status.count <= 3}\"><br />	<img class=\"img-circle photo-small\" src=\"${user.photo}\"><br /></c:if>', 'chenzhong.sy@star-net.cn', '2017-08-21 13:54:01', 'chenzhong.sy@star-net.cn', '2017-08-21 13:54:01', '1');
INSERT INTO `comment` VALUES ('150329489305', 'task', 'T17082113454481', 'c:if 标签多条件判断：<br />\"<c:if test=\"${fn:contains(task.assignTo, user.email) and status.count <= 3}\"><br />													<img class=\"img-circle photo-small\" src=\"${user.photo}\"><br />												</c:if>\"', 'dingqingfa@star-net.cn', '2017-08-21 13:54:54', 'dingqingfa@star-net.cn', '2017-08-21 13:54:54', '1');
INSERT INTO `comment` VALUES ('150329512069', 'task', 'T17082113454481', '新增留言时先清空输入框内容。', 'dingqingfa@star-net.cn', '2017-08-21 13:58:41', 'dingqingfa@star-net.cn', '2017-08-21 13:58:41', '0');
INSERT INTO `comment` VALUES ('150330014669', 'task', 'T17082115212269', 'AMQP，即Advanced Message Queuing Protocol,一个提供统一消息服务的应用层标准高级消息队列协议,是应用层协议的一个开放标准,为面向消息的中间件设计。', 'chenzhong.sy@star-net.cn', '2017-08-21 15:22:27', 'chenzhong.sy@star-net.cn', '2017-08-21 15:22:27', '1');
INSERT INTO `comment` VALUES ('150330017243', 'task', 'T17082115212269', 'AMQP，即Advanced Message Queuing Protocol,一个提供统一消息服务的应用层标准高级消息队列协议,是应用层协议的一个开放标准,为面向消息的中间件设计。', 'dingqingfa@star-net.cn', '2017-08-21 15:22:53', 'dingqingfa@star-net.cn', '2017-08-21 15:22:53', '0');
INSERT INTO `comment` VALUES ('150330058162', 'task', 'T17082115212269', 'RabbitMQ是一个由erlang开发的AMQP（Advanced Message Queue ）的开源实现。AMQP 的出现其实也是应了广大人民群众的需求，虽然在同步消息通讯的世界里有很多公开标准（如 COBAR的 IIOP ，或者是 SOAP 等），但是在异步消息处理中却不是这样，只有大企业有一些商业实现（如微软的 MSMQ ，IBM 的 Websphere MQ 等），因此，在 2006 年的 6 月，Cisco 、Redhat、iMatix 等联合制定了 AMQP 的公开标准。', 'dingqingfa@star-net.cn', '2017-08-21 15:29:42', 'dingqingfa@star-net.cn', '2017-08-21 15:29:42', '1');
INSERT INTO `comment` VALUES ('150330059653', 'task', 'T17082115212269', 'RabbitMQ是一个由erlang开发的AMQP（Advanced Message Queue ）的开源实现。<br />AMQP 的出现其实也是应了广大人民群众的需求，虽然在同步消息通讯的世界里有很多公开标准（如 COBAR的 IIOP ，或者是 SOAP 等），但是在异步消息处理中却不是这样，只有大企业有一些商业实现（如微软的 MSMQ ，IBM 的 Websphere MQ 等），因此，在 2006 年的 6 月，Cisco 、Redhat、iMatix 等联合制定了 AMQP 的公开标准。', 'dingqingfa@star-net.cn', '2017-08-21 15:29:57', 'dingqingfa@star-net.cn', '2017-08-21 15:29:57', '0');
INSERT INTO `comment` VALUES ('150330063722', 'task', 'T17082115212269', 'http://blog.csdn.net/anzhsoft/article/details/19563091', 'dingqingfa@star-net.cn', '2017-08-21 15:30:37', 'dingqingfa@star-net.cn', '2017-08-21 15:30:37', '0');
INSERT INTO `comment` VALUES ('150338880877', 'task', 'T17082216000748', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 16:00:08', 'chenzhong.sy@star-net.cn', '2017-08-22 16:00:08', '0');
INSERT INTO `comment` VALUES ('150338973749', 'task', 'T17082216153745', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 16:15:37', 'chenzhong.sy@star-net.cn', '2017-08-22 16:15:37', '0');
INSERT INTO `comment` VALUES ('150339003366', 'task', 'T17082216202844', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 16:20:34', 'chenzhong.sy@star-net.cn', '2017-08-22 16:20:34', '0');
INSERT INTO `comment` VALUES ('150339257109', 'task', 'T17082217025165', '创建了这个任务。 --auto create', 'chenzhong.sy@star-net.cn', '2017-08-22 17:02:52', 'chenzhong.sy@star-net.cn', '2017-08-22 17:02:52', '0');
INSERT INTO `comment` VALUES ('150339729672', 'task', 'T17072111340965', '说点什么', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:37', 'chenzhong.sy@star-net.cn', '2017-08-22 18:21:37', '0');
INSERT INTO `comment` VALUES ('150340085366', 'task', 'T17082219204886', '创建了这个任务。 --auto create', 'dingqingfa@star-net.cn', '2017-08-22 19:20:53', 'dingqingfa@star-net.cn', '2017-08-22 19:20:53', '0');
INSERT INTO `comment` VALUES ('150340121635', 'task', 'T17082219265146', '创建了这个任务。 --auto create', 'dingqingfa@star-net.cn', '2017-08-22 19:26:57', 'dingqingfa@star-net.cn', '2017-08-22 19:26:57', '0');
INSERT INTO `comment` VALUES ('150340156387', 'task', 'T17082219323841', '创建了这个任务。 --automatic generation--', 'dingqingfa@star-net.cn', '2017-08-22 19:32:43', 'dingqingfa@star-net.cn', '2017-08-22 19:32:43', '0');
INSERT INTO `comment` VALUES ('150345423725', 'task', 'T17082310103761', '创建了这个任务。 --automatic generation--', 'dingqingfa@star-net.cn', '2017-08-23 10:10:38', 'dingqingfa@star-net.cn', '2017-08-23 10:10:38', '0');
INSERT INTO `comment` VALUES ('150449340780', 'task', 'T17090410500733', '创建了这个任务。 --automatic generation--', 'dingqingfa@star-net.cn', '2017-09-04 10:50:08', 'dingqingfa@star-net.cn', '2017-09-04 10:50:08', '0');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '项目名称',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目需求',
  `status` varchar(64) DEFAULT NULL COMMENT '项目状态：1、未开始，2、正在进行，3、已完成，4、已结项，5、已归档',
  `progress` varchar(64) DEFAULT NULL COMMENT '项目进度',
  `project_manager` varchar(64) DEFAULT NULL COMMENT '项目经理',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `expect_finish_date` datetime DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` datetime DEFAULT NULL COMMENT '实际完成时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('100', 'T91R', 'first project', null, null, null, 'dqf', '2017-07-27 19:45:16', null, null, null, null, null);
INSERT INTO `project` VALUES ('1002', 'I66', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1003', 'I68', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project` VALUES ('1004', 'teamwork', null, null, null, null, '丁庆发', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('11', '辅助生产', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('12', '成品定制', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('13', '方案预研', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('14', '成品维护', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('15', '板卡定制', null, null, null, null, 'admin', null, null, null, null, null, null);
INSERT INTO `project` VALUES ('P17082219354920', 'X66L', '楼宇设备新产品，DS2600处理器，linux平台。\r\n和X66_3.0 共用主板。', '0', '0%', 'liqing@star-net.cn', 'dingqingfa@star-net.cn', '2017-08-22 19:35:50', 'dingqingfa@star-net.cn', '2017-08-22 19:35:50', '2017-08-22 19:35:50', null, '0');

-- ----------------------------
-- Table structure for subtask
-- ----------------------------
DROP TABLE IF EXISTS `subtask`;
CREATE TABLE `subtask` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '所属任务',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '检查项描述',
  `status` varchar(64) DEFAULT NULL COMMENT '任务状态：0、未完成，1、已完成',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子任务';

-- ----------------------------
-- Records of subtask
-- ----------------------------
INSERT INTO `subtask` VALUES ('150303539524', 'T17072111340965', '重新设计UI', '1', null, '2017-08-18 13:49:56', null, '2017-08-22 18:19:32', null);
INSERT INTO `subtask` VALUES ('150329438031', 'T17082113454481', '任务面板头部最多显示3个处理人；', '1', null, '2017-08-21 13:46:20', null, '2017-08-21 13:47:11', null);
INSERT INTO `subtask` VALUES ('150336782165', 'T17080410424594', '测试', '1', null, '2017-08-22 10:10:21', null, '2017-08-22 10:10:23', null);
INSERT INTO `subtask` VALUES ('150339717184', 'T17072111340965', '编写桌面widget', '0', null, '2017-08-22 18:19:31', null, '2017-08-22 18:19:31', null);
INSERT INTO `subtask` VALUES ('150339719694', 'T17072111340965', '实现监视、呼叫物业、布撤防、通话记录功能。', '0', null, '2017-08-22 18:19:56', null, '2017-08-22 18:19:56', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `en_name` varchar(64) DEFAULT NULL COMMENT '英文名称',
  `sort` varchar(64) DEFAULT NULL COMMENT '分类',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('10001', '初稿', 'new', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10002', '正在处理', 'doing', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10003', '完成', 'done', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10004', '已审核', 'checked', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10005', '已归档', 'archived', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('10006', '暂停', 'pause', 'task_status', null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('20001', 'DS3000', 'DS3000', 'article_category_platform', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20002', 'DS2600', 'DS2600', 'article_category_platform', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20003', 'DS2000', 'DS2000', 'article_category_platform', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20004', 'MCU', 'MCU', 'article_category_platform', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20005', 'C&C++', 'C&C++', 'article_category_language', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20006', 'Java', 'Java', 'article_category_language', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20007', 'Python', 'Python', 'article_category_language', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20008', 'Shell', 'Shell', 'article_category_language', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20009', 'JS&Jquery', 'Js&Jquery', 'article_category_language', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20010', 'Linux', 'Linux', 'article_category_system', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20011', 'Android', 'Android', 'article_category_system', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20012', 'IOS', 'IOS', 'article_category_system', null, null, null, null, '0');
INSERT INTO `sys_dict` VALUES ('20013', 'JavaWeb', 'JavaWeb', 'article_category_system', null, null, null, null, '0');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `project_name` varchar(64) DEFAULT NULL COMMENT '所属项目',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务标题',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务描述',
  `status` varchar(64) DEFAULT NULL COMMENT '任务状态：1、未分配，2、正在处理，3、已完成，4、已审核，5、已归档',
  `progress` varchar(64) DEFAULT NULL COMMENT '任务进度',
  `priority` varchar(32) DEFAULT NULL COMMENT '优先级',
  `assign_to` varchar(256) DEFAULT NULL COMMENT '处理者',
  `follower` varchar(256) DEFAULT NULL COMMENT '关注人',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `expect_finish_date` varchar(64) DEFAULT NULL COMMENT '期望完成时间',
  `real_finish_date` varchar(64) DEFAULT NULL COMMENT '实际完成时间',
  `finish_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '完成说明',
  `finish_link` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '任务标题',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('T17071817150796', 'teamwork', '账号注册登录以及权限校验', 'fsfffffffff啊手动阀手动阀', '10003', '100%', '0', 'dingqingfa@star-net.cn', 'chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn;hongguifang@star-net.cn;chenronghui@star-net.cn;dingqingfa@star-net.cn', null, '2017-07-18 17:15:07', null, '2017-08-22 19:12:18', '2017-07-21', '', '', '', '0');
INSERT INTO `task` VALUES ('T17072111340965', 'teamwork', '魔镜第二阶段，新样机，带网线', '需要实现以下功能：<br />1. 重新设计UI；<br />2. 编写桌面空间widget；<br />3. 实现基本功能，呼叫中心、监视、记录；<br />', '10002', '33%', '1', 'hongguifang@star-net.cn', 'chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn;hongguifang@star-net.cn;chenronghui@star-net.cn;dingqingfa@star-net.cn', null, '2017-07-21 11:34:10', null, '2017-09-04 11:00:55', '2017-09-15', '2017-07-29', '处理说明', 'http://www.baidu.com/abcd', '0');
INSERT INTO `task` VALUES ('T17073000453713', 'teamwork', '文件上传与管理功能', '', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn', null, '2017-07-30 00:45:38', null, '2017-08-22 19:34:17', '2017-07-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17080215071754', 'teamwork', '搜索功能', '搜索内容', '10002', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;chenzhong.sy@star-net.cn;liqing@star-net.cn;linshengteng@star-net.cn;fangxuerong@star-net.cn;huangwenwen@star-net.cn;hongguifang@star-net.cn;chenronghui@star-net.cn', null, '2017-08-02 15:07:18', null, '2017-09-04 10:50:39', '2017-08-10', null, null, null, '0');
INSERT INTO `task` VALUES ('T17081614174204', 'teamwork', '使用redis缓存', '提高系统响应速度；<br />管理用户登录信息；', '10002', '83%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn;huangwenwen@star-net.cn', null, '2017-08-16 14:17:42', null, '2017-08-22 19:07:43', '2017-08-19', null, null, null, '1');
INSERT INTO `task` VALUES ('T17082109121894', '成品定制', '小咚批量生产问题跟踪', '新一批小咚代工生产过程中出现一定数量设备无法正常配对的问题。', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-21 09:12:18', null, '2017-09-01 16:46:19', '2017-08-25', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082113454481', 'teamwork', '任务管理功能完善', '详见', '10003', '100%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-21 13:45:44', null, '2017-08-21 13:59:28', '2017-08-25', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082115212269', '成品定制', 'T91对接花样年云平台', '1.使用AMQP协议。', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-21 15:21:23', null, '2017-08-22 19:34:16', '2017-09-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082219204886', 'teamwork', '知识文章功能模块', '支持文章增删改；<br />支持按类别查看；', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-22 19:20:48', null, '2017-09-01 22:39:57', '2017-08-25', null, null, null, '1');
INSERT INTO `task` VALUES ('T17082219265146', '成品定制', '花样年T91对接云平台', '支持sip对讲；<br />实现amqp协议；<br />实现远程控制；', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-22 19:26:52', null, '2017-08-22 19:34:14', '2017-09-30', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082219323841', 'teamwork', '测试任务1', '什么事；<br />阿萨德发<br />a文文；', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-22 19:32:38', null, '2017-08-22 19:34:03', '2017-08-31', null, null, null, '0');
INSERT INTO `task` VALUES ('T17082310103761', 'teamwork', '这是一个测试任务3', '', '10001', '0%', '0', 'dingqingfa@star-net.cn', 'dingqingfa@star-net.cn', null, '2017-08-23 10:10:38', null, '2017-08-23 10:10:38', '2017-08-31', null, null, null, '0');
INSERT INTO `task` VALUES ('T17090410500733', '成品定制', 'X66_3.0 对接自主智能家居中控', '1. 电器：4个开关灯，1个窗帘，4种安防模式；<br />2. 进入控制界面时支持状态回读，用于更新电器状态；<br />3. 9月4日先提供控制命令数据供对方对接；<br />4. 控制命令需要对方回复数据；<br />5. 样板房演示用，不需要提测。<br />', '10002', '0%', '1', 'hongguifang@star-net.cn', 'hongguifang@star-net.cn', null, '2017-09-04 10:50:08', null, '2017-09-04 11:01:02', '2017-09-06', null, null, null, '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `qrcode` varchar(1000) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `login_name` (`login_name`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('102', null, null, null, 'T11478', 'T11478', '陈钟', 'chenzhong.sy@star-net.cn', null, null, null, '/images/photo/giraffe.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('103', null, null, null, 'T10667', 'T10667', '李晴', 'liqing@star-net.cn', null, null, null, '/images/photo/lion.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('104', null, null, null, 'T11441', 'T11441', '林圣腾', 'linshengteng@star-net.cn', null, null, null, '/images/photo/zhiwu.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('105', null, null, null, 'T4025', 'T4025', '方雪嵘', 'fangxuerong@star-net.cn', null, null, null, '/images/photo/zebra.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('106', null, null, null, 'T12665', 'T12665', '黄文文', 'huangwenwen@star-net.cn', null, null, null, '/images/photo/dragon.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('107', null, null, null, 'T12693', 'T12693', '洪桂芳', 'hongguifang@star-net.cn', null, null, null, '/images/photo/elephant.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('108', null, null, null, 'T13482', 'T13482', '陈荣辉', 'chenronghui@star-net.cn', null, null, null, '/images/photo/pig.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('109', null, null, null, '115513875', 'T10316', '丁庆发', 'dingqingfa@star-net.cn', null, null, null, '/images/photo/hippo.png', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('110', null, null, null, 'T10663', 'T10663', '王锦乐', 'wangjinle@star-net.cn', null, null, null, '/images/photo/bear.png', null, null, null, null, null, null, null, null, '0', null);
