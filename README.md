# Miniature Octo Vienna

The name has nothing to do with the repo, GitHub suggested.

This repository intends to demonstrate an approach to achieving a modularized microservice system. By bundling the service source code, API documentation and infrastructure codes to decouple the constraint across services.

## Installation

```sh
cd infrastructure ; npm install
npm run openapi   # bundle OpenAPI definitions into a single file
npm run terraform # construct the server group and api gateway on Docker
```
