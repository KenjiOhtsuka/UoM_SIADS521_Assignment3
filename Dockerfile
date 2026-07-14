FROM jupyter/base-notebook:latest

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /home/jovyan/work
USER root
RUN chmod -R a-w /home/jovyan/work
# RUN apt-get update && apt-get install -y iptables sudo

EXPOSE 8888
USER jovyan
CMD ["start-notebook.sh", "--NotebookApp.token=''","--NotebookApp.allow_origin='*'"]
