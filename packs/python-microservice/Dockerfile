FROM python:3.7-alpine

ARG app_name
#ARG PIP_EXTRA_INDEX_URL TODO: enable this and disable below once skaffold support build args from env vars
COPY ./PIP_EXTRA_INDEX_URL ./PIP_EXTRA_INDEX_URL

# all python deps are installed with pipenv
RUN pip install pipenv
# make the folder for the app's instance
COPY Pipfile Pipfile.lock ./
# `ENV` persists ;)
ENV PIP_USER=1 PYTHONUSERBASE=/pyroot PATH="/pyroot/bin:${PATH}"
RUN pipenv install --ignore-pipfile --deploy -v --system $install_command_append
# now copy everything else, not ignored by .dockerignore
COPY . .

CMD make run
