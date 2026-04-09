# Use the official Python image as a base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY . .

# Explicitly copy static folder (just in case)
COPY static/ /app/static/

# Ensure the .env file is copied
COPY .env .env

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "run.py"]