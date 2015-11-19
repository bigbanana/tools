# /bin/bash

name=$1;
password=$2;

if [ -z "$name" -o -z "$password" ] ;then
 printf "\n请输入帐户和密码\n";
 exit;
fi

# 登录
printf "\n开始登录\n"
curl \
 -c ./cookie_smzdm.txt \
 -b ./cookie_smzdm.txt \
 -F username=${name} \
 -F password=${password} \
 -F rememberme="on" \
 -F captcha="" \
 -F redirect_url="http://www.smzdm.com" \
 -o index.html \
 -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36" \
 http://zhiyou.smzdm.com/user/login/ajax_check

printf "\n登录成功\n"


# 获取用户信息
printf "\n尝试获取用户信息\n"
 curl \
 -c ./cookie_smzdm.txt \
 -b ./cookie_smzdm.txt \
 -o userinfo.json \
 -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36" \
 http://zhiyou.smzdm.com/user/info/jsonp_get_current

 printf "\n"
 sed -r $'1s/^|$/\'/g' userinfo.json | xargs printf
 printf "\n"

# 签到
printf "\n尝试签到\n"
 curl \
 -c ./cookie_smzdm.txt \
 -b ./cookie_smzdm.txt \
 -o qiandao.json \
 -H "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36" \
 http://www.smzdm.com/user/qiandao/jsonp_checkin

 printf "\n"
 sed -r $'1s/^|$/\'/g' qiandao.json | xargs printf
 printf "\n"
