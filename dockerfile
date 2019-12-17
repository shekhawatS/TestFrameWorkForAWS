# Base the docker image on the Microsoft dotnet core 3.0 image
FROM mcr.microsoft.com/dotnet/core/sdk:3.0

# Expose ASP.NET web app at port 6000
ENV ASPNETCORE_URLS http://+:6000

# Set current workdirectory in the docker image
WORKDIR /tst

# First only copy the web app project file inside the image and restore dependencies.
COPY /SampleWebApp/SampleWebApp.csproj ./
RUN dotnet restore

# Copy the complete source code and build/publish it to
# the /app directory in the image
COPY /SampleWebApp/. ./
RUN dotnet publish -c Release -o /app

# Expose ports outside the image
EXPOSE 6000-6001

# Run command for the web application
ENTRYPOINT ["dotnet", "/app/SampleWebApp.dll"]
