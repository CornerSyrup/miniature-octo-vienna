# Miniature Octo Vienna

![](https://img.shields.io/github/license/KleinChiu/miniature-octo-vienna)

The name has nothing to do with the repo, GitHub suggested.

This repository intends to demonstrate an approach to achieving a modularized microservice system.
By bundling the service source code, API documentation and infrastructure codes to decouple the constraint across services.

Have a look at [my medium blog post](https://medium.com/@kleinc./going-further-on-iac-for-microservices-with-terraform-and-openapi-bbd2c2fdca65) for more detail.

## Installation

```sh
cd infrastructure ; npm install
npm run openapi   # bundle OpenAPI definitions into a single file
npm run terraform # construct the server group and api gateway on Docker
```
