# Base the docker image on the Microsoft dotnet core 3.0 image
FROM microsoft/dotnet:2.1-sdk

# Expose ASP.NET web app at port 6000
ENV ASPNETCORE_URLS http://+:6000

# Set current workdirectory in the docker image
WORKDIR /app

# First only copy the web app project file inside the image and restore dependencies.
COPY /testframework/CDAAS_TestFramework/CDAAS_TestFramework.csproj ./
RUN dotnet restore

# Copy the complete source code and build/publish it to
# the /app directory in the image
COPY /testframework/CDAAS_TestFramework/. ./
RUN dotnet publish -c Release -o /app

# Expose ports outside the image
EXPOSE 6000-6001

# Run command for the web application
ENTRYPOINT ["dotnet", "vstest", "CDAAS_TestFramework.dll"]
