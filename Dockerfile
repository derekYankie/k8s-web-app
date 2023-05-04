# Containerize Flask Webapp
# Date: 05/01/2023
# Author: derekYankie

# Container OS for Flask Webapp
FROM python:3.7-alpine

# Set working directory for Docker to use
WORKDIR /app

# Set environment variables
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# ENV FLASK_RUN_PORT=5000
ENV CUSTOM_HEADER='My Containerized Flask Webapp'
ENV BG_COLOR=dodgerblue
ENV FONT_COLOR=black
ENV CUSTOM_PHOTO='https://raw.githubusercontent.com/derekYankie/packaroo/master/static/skate_kit.jpg'

# Copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# Install the dependencies and packages in the requirements file
RUN pip3 install -r requirements.txt

# Copy every content from the local file to the image
COPY . /app

# Run flask server
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
