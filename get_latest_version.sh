#!/bin/bash

# Function to get the latest listed version of a NuGet package
get_latest_version() {
    PACKAGE_ID=$1

    # Check if PACKAGE_ID is blank 
    if [ -z "$PACKAGE_ID" ]; 
        then echo "Error: No package ID provided. Please provide a package ID as an argument." 
        exit 1 
    fi
    
    #echo "Package ID: $PACKAGE_ID"

    # Perform the search using mono nuget.exe with -Take parameter 
    # Search for the package and get the latest version
    SEARCH_RESULT=$(mono /usr/local/bin/nuget.exe search "$PACKAGE_ID" -Source $SOURCE_URL -Take $TAKE )

    # Check if the search was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to search for NuGet package" >&2
        exit 1
    fi

    #echo "Search Result: $SEARCH_RESULT"

    # Parse the version numbers from the search results using awk 
    version=$(echo "$SEARCH_RESULT" | grep ExampleTemperatureConverter | awk -F '|' '{print $2}' | xargs)   
    echo "Parsed version number: $version"
}

SOURCE_URL="https://api.nuget.org/v3/index.json" 
TAKE=1
# Call the function with the provided package ID
get_latest_version $1