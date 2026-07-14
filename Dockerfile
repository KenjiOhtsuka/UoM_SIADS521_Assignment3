FROM jupyter/base-notebook:latest

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /home/jovyan/work
RUN chown -R root:root /home/jovyan/work
RUN chmod -R 444 /home/jovyan/work

RUN apt-get update && apt-get install -y iptables
RUN iptables -P OUTPUT DROP

EXPOSE 8888
CMD ["start-notebook.sh", "--NotebookApp.token=''","--NotebookApp.allow_origin='*'"]
