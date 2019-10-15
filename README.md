# finlab2-course

## 一般啟動
```sh
docker run -itd --name finlab2-jupyter -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes -p 8888:8888 -v $PWD/python:/home/jovyan/work finlab2-course:latest start-notebook.sh --NotebookApp.ip='*' --NotebookApp.token=''
```

## Docker-compose啟動
`Windows用戶請使用Windows版本`
```sh
git https://github.com/t985026/finlab2-course.git

cd finlab2-course
cp .env.sample .env
docker-compose up -d

# 查看Log
docker-compose logs -f
```