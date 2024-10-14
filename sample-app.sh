
#!/bin/bash
set -euo pipefail

# Create necessary directories if they don't exist
if [ ! -d "tempdir" ]; then
    mkdir tempdir
fi
if [ ! -d "tempdir/templates" ]; then
    mkdir tempdir/templates
fi
if [ ! -d "tempdir/static" ]; then
    mkdir tempdir/static
fi

# Copy application files
cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

# Create Dockerfile
cat > tempdir/Dockerfile << _EOF_
FROM python
RUN pip install flask
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
COPY  sample_app.py /home/myapp/
EXPOSE 5050
CMD python /home/myapp/sample_app.py
_EOF_

cd tempdir || exit

# Build the Docker image
docker build -t sampleapp .

# Stop and remove the existing container if it exists
if docker ps -a --format '{{.Names}}' | grep -Eq "^samplerunning\$"; then
    docker stop samplerunning
    docker rm samplerunning
fi

# Run the Docker container with the specified name
docker run -t -d -p 5050:5050 --name samplerunning sampleapp

# List all containers
docker ps -a

