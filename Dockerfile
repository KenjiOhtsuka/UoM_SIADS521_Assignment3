FROM jupyter/base-notebook:latest

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /home/jovyan/work
EXPOSE 8888
CMD ["start-notebook.sh", "--NotebookApp.token=''","--NotebookApp.allow_origin='*'"]
