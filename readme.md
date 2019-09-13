# finlab2-course
```sh
docker run -itd --name finlab2-jupyter -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes -p 8888:8888 -v $PWD/python:/home/jovyan/work finlab2-course:latest start-notebook.sh --NotebookApp.ip='*' --NotebookApp.token=''
```
