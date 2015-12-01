# /bin/bash

name=$1;
password=$2;
dir=/home/shell/smzdm;
log=${dir}/log.log;

if [ -z "$name" -o -z "$password" ] ;then
 printf "\n请输入帐户和密码\n";
 exit;
fi

random=$(awk 'BEGIN{srand();sum=rand()*1000;printf("%d\n",sum)}');
printf "\n\n\n---------------开始任务---------------\n\n\n" >> $log;
date >> $log;
printf "休眠"${random}"秒\n" >> $log;
sleep $random;
date >> $log;

# 登录
printf "\n开始登录\n" >> $log;
curl \
 -c ${dir}/cookie_smzdm.txt \
 -b ${dir}/cookie_smzdm.txt \
 -F username=${name} \
 -F password=${password} \
 -F rememberme="on" \
 -F captcha="" \
 -F redirect_url="http://www.smzdm.com" \
 -o ${dir}/index.html \
 -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36" \
 http://zhiyou.smzdm.com/user/login/ajax_check

printf "\n登录成功\n" >> $log;


# 获取用户信息
printf "\n尝试获取用户信息\n" >> $log;
 curl \
 -c ${dir}/cookie_smzdm.txt \
 -b ${dir}/cookie_smzdm.txt \
 -o ${dir}/userinfo.json \
 -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36" \
 http://zhiyou.smzdm.com/user/info/jsonp_get_current

 printf "\n"
 sed -r $'1s/^|$/\'/g' ${dir}/userinfo.json | xargs printf >> $log;
 printf "\n"

# 签到
printf "\n\n尝试签到\n" >> $log;
 curl \
 -c ${dir}/cookie_smzdm.txt \
 -b ${dir}/cookie_smzdm.txt \
 -o ${dir}/qiandao.json \
 -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36" \
 http://www.smzdm.com/user/qiandao/jsonp_checkin

 printf "\n"
 sed -r $'1s/^|$/\'/g' ${dir}/qiandao.json | xargs printf >> $log;
 printf "\n"

printf "\n\n\n---------------任务完成----------------\n\n\n" >> $log;

