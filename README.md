## Automating Docker Image Tagging with Semantic Release and GitHub Actions for a Go Application
Set up a CI/CD pipeline using GitHub Actions to automate Docker image builds and tagging for a Go application. The pipeline uses [Semantic Release](https://semantic-release.gitbook.io/semantic-release) based on [Conventional Commits](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#-commit-message-format) to [increment version numbers](https://semver.org/) automatically.

### Key features
- Semantic Release: Automatically [increments the version number](https://semver.org/) based on commit message conventions
- Docker Integration: Builds and pushes Docker images with both versioned and latest tag to Docker Hub
- Conventional Commits: The pipeline follows [Conventional Commits](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#-commit-message-format) to determine if a new release is necessary.

### How it works
The pipeline is triggered on:
- Pull Requests: Executes the build step to ensure code integrity.
- PR merged to Master: Runs the full pipeline, including building the Go app, generating version number, tagging the image version, and pushing the Docker image.
- When no relevants changes is added, pipeline will fail on `check was generated version` step

The complete pipeline code should be found [here](.github/workflows/ci-cd.yaml)

### Requirements

You need to set up the following 3 secrets in your repository:

- `GH_TOKEN`
   - Required for Semantic Release, to make changes in the repository, such as creating tags
- `DOCKERHUB_USERNAME`
   - Docker hub username where images will be pushed
- `DOCKERHUB_TOKEN`
   - Docker Hub password to authenticate and push the images.