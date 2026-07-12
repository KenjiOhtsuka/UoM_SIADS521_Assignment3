FROM jupyter/base-notebook:latest
COPY . /home/jovyan/work
EXPOSE 8888
CMD ["start-notebook.sh", "--NotebookApp.token=''","--NotebookApp.allow_origin='*'"]
