# Use the official Python image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the Code, Model, and app.py into the container at /app
COPY Code/ /app/Code/
COPY Model/ /app/Model/
COPY app.py /app/

# Expose the port that Flask will run on
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Command to run on container start
CMD ["flask", "run", "--host=0.0.0.0"]