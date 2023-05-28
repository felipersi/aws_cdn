git clone https://github.com/felipersi/aws_cdn.git /tmp/aws_cdn

systemctl stop nginx

rm -Rf /etc/nginx/nginx.conf

mv /tmp/aws_cdn/nginx.conf /etc/nginx/

chmod 777 /etc/nginx/nginx.conf
chown nginx:nginx /etc/nginx/nginx.conf

dynamic_ip = ifconfig eth0 | grep 'inet ' | awk '{print $2}'

sed -i 's/eth0_ip/'$dynamic_ip'/' /etc/nginx/nginx.conf

systemctl start nginx
