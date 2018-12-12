FROM python:3.6.6

MAINTAINER Arturo Heavy::Industries <heavy@arturo.ai>

ARG PIP_EXTRA_INDEX_URL

RUN pip install pipenv
COPY Pipfile Pipfile.lock /app/
WORKDIR /app
RUN export PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL} && pipenv sync --dev

COPY . /app

ENTRYPOINT ["pipenv", "run"]
CMD ["python", "--version"]