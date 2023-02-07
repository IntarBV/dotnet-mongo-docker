# Dotnet Mongo

This image has .NET 7.0 and MongoDB 6.0 installed. Images with the `httpbin-` tag prefix additionally have httpbin installed.

## ARCHIVED

This image is no longer maintained. We used this in CircleCI and I recently learned that you can run multiple containers side-by-side in CircleCI. The feature is relatively poorly documented, but allows me to spin up a standard `mcr.microsoft.com/dotnet/sdk` container with a secondary standard `mongo` container next to it. Therefore there's no need for this repository any more.
