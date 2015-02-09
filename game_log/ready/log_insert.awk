BEGIN{split(ARGV[1],ln,".");tb_name=substr(ln[1],1,19);printf "use game_log;\n\
CREATE TABLE IF NOT EXISTS `%s` (\n\
  `code` varchar(255) DEFAULT NULL,\n\
  `user_id` varchar(255) DEFAULT NULL,\n\
  `p1` varchar(255) DEFAULT NULL,\n\
  `p2` varchar(255) DEFAULT NULL,\n\
  `p3` varchar(255) DEFAULT NULL,\n\
  `p4` varchar(255) DEFAULT NULL,\n\
  `p5` varchar(255) DEFAULT NULL,\n\
  `p6` varchar(255) DEFAULT NULL,\n\
  `p7` varchar(255) DEFAULT NULL,\n\
  `update_time` datetime DEFAULT NULL\n\
) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n",tb_name\
}
{v=$3;pn = split($3,ps,",")}
{printf "INSERT INTO %s (update_time,code,user_id,p1,p2,p3,p4,p5,p6,p7)\
VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s');\n",\
tb_name,substr($1,2)" "substr($2,1,8),ps[1],ps[2],ps[3],ps[4],ps[5],ps[6],ps[7],ps[8],ps[9]}