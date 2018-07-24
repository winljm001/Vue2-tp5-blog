# Vue2-tp5-blog
My blog
## git秘钥生成
> git config --global user.name "昵称"

git config --global user.email "你的邮箱"

ssh-keygen -t rsa -C "你的邮箱"

## 项目拉取
> git init
git remote add origin git@github.com:winljm001/Vue2-tp5-blog.git
git pull origin master
git push -u origin master

## 项目web页面的安装
> npm install --registry=https://registry.npm.taobao.org
npm run dev
npm run build

