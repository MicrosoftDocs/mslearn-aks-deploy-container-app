---
page_type: sample
languages:
- go
- javascript
- html
- css
products:
- aks
description: "Demo application for the 'Creating an AKS application' learn module"
urlFragment: "deploy-container-app-aks-demo"
---

# Official Microsoft Sample

<!--
Guidelines on README format: https://review.docs.microsoft.com/help/onboard/admin/samples/concepts/readme-template?branch=master

Guidance on onboarding samples to docs.microsoft.com/samples: https://review.docs.microsoft.com/help/onboard/admin/samples/process/onboarding?branch=master

Taxonomies for products and languages: https://review.docs.microsoft.com/new-hope/information-architecture/metadata/taxonomies?branch=master
-->

This is the base demonstration for the "Deploying a containerized application in AKS" learn module.

## Summary

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Official Microsoft Sample](#official-microsoft-sample)
  - [Summary](#summary)
  - [Contents](#contents)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Running the sample](#running-the-sample)
  - [Running the image](#running-the-image)
  - [Deploying to Kubernetes](#deploying-to-kubernetes)
  - [Key concepts](#key-concepts)
  - [Contributing](#contributing)

<!-- /code_chunk_output -->

## Contents

Outline the file contents of the repository. It helps users navigate the codebase, build configuration and any related assets.

| File/folder       | Description                                |
|-------------------|--------------------------------------------|
| `src`             | Sample source code.                        |
| `.gitignore`      | Define what to ignore at commit time.      |
| `CHANGELOG.md`    | List of changes to the sample.             |
| `CONTRIBUTING.md` | Guidelines for contributing to the sample. |
| `README.md`       | This README file.                          |
| `LICENSE`         | The license for the sample.                |
| `Dockerfile`      | Docker image file                          |

## Prerequisites

This sample is built using [Hugo](https://gohugo.io), therefore it is needed as prerequisite to run this example.

## Setup

After cloning the repository, init the theme repository by running `git submodule update --init src/themes/introduction` **in the root directory**.

## Running the sample

1. Get into the `src` directory
2. Run `hugo server -D`
3. Access the URL given by the Terminal

## Running the image

Assuming you already have [Docker](https://docs.docker.com/get-docker/) installed, just run `docker build -t image-name .` on the root directory.

To execute it, run: `docker run -p <local-port>:80 image-name`

You can also opt to run it from the remote source using `docker run -p <local-port>:80 mcr.microsoft.com/mslearn/samples/contoso-website`

## Deploying to Kubernetes

Inside the [Kubernetes](./kubernetes) directory, you'll have all necessary resources to deploy the application to an AKS cluster using the [HTTP Application Routing Addon](https://docs.microsoft.com/azure/aks/http-application-routing?WT.mc_id=learndeploycontainerappsaks-learn-ludossan).

1. Update the [Ingress.yaml](./kubernetes/ingress.yaml) file and update your specific DNS zone to the one you have in your AKS cluster, this information can be found in the DNS zone resource inside the resource group of your cluster
2. Use `Kubectl apply -f <filename>` to all the files in the directory to create the workloads

## Key concepts

Hugo is a static build engine that allows users to create static websites. The idea behind this demo is to show how we can deploy a containerized application to AKS.

There's a [Dockerfile](./Dockerfile) in the root of the repository, this Dockerfile is responsible for generating the image we'll be using to deploy the website. It's a simple NGINX default image, in it we do a few steps:

- Update all the packages
- Install curl, git and Node.js
- Download and install Hugo
- Install PostCSS and autoprefixer using NPM globally as they are requirements for the theme
- Clone the repository and init all submodules
- Generate a static web page from the website template
- Move that directory into NGINX public folder
- Expose port 80 so we can access it from the cluster

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
