FROM registry.access.redhat.com/rhscl/python-34-rhel7

USER 0

ENV LD_LIBRARY_PATH=/opt/rh/rh-python34/root/usr/lib64:${LD_LIBRARY_PATH}
ADD requirements.txt .
RUN pip3 install -U -r requirements.txt

ADD . /src

COPY ./deployment/logging.conf /src/logging.conf

EXPOSE 5000

RUN chmod -R 777 /src

ENTRYPOINT ["python"]
CMD ["/src/application.py" ]