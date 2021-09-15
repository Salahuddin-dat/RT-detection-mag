# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
# port
EXPOSE 8080

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
# copy all the file inside the project
COPY . ./

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["main.py"]