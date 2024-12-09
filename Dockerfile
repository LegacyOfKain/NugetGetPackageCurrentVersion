# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Install dependencies including Mono 
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    wget \
    mono-complete \
    && rm -rf /var/lib/apt/lists/* 
# Download NuGet.exe 
RUN wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O /usr/local/bin/nuget.exe 

# Add the Bash script to the Docker image
COPY get_latest_version.sh /usr/local/bin/get_latest_version.sh

# Make the script executable 
RUN chmod +x /usr/local/bin/get_latest_version.sh 

# Run the Bash script when the container starts with the argument 
CMD ["/usr/local/bin/get_latest_version.sh", "exampletemperatureconverter"]
