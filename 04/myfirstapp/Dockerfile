FROM arm32v7/python:3.6.5-slim

ENV HOME /root
ENV FLASK_DEBUG 1

WORKDIR ${HOME}

COPY app.py ${HOME}/

RUN set -x \
 && pip --no-cache-dir install flask \
 && rm -fr /root/.cache/

CMD ["python3", "app.py"]

EXPOSE 5000
