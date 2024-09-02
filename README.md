# DevOps Project: Manage SPOTIFY using TERRAFORM! 👨‍💻 🎵

In this project, we'll demonstrate how to use Terraform to manage Spotify resources, specifically creating and managing playlists. By integrating Terraform with the Spotify API, we can automate playlist management using code.

## Steps to Follow

### 🔧 Setup Spotify Provider
**Objective:** Integrate Terraform with the Spotify API.  
**Action:** Configure the Spotify provider in your Terraform configuration file to enable interaction with Spotify’s services.

### 🌐 Create an App on Spotify Developer Account
**Objective:** Obtain credentials to access Spotify’s API.  
**Action:** Sign in to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/) and register a new application. This will provide you with the Client ID and Client Secret needed for authentication.

### 🐳 Run Spotify Auth Proxy as a Docker Container
**Objective:** Facilitate OAuth authentication with Spotify’s API.  
**Action:** Use a Docker container running the Spotify Auth Proxy to handle OAuth flows and obtain access tokens. This is essential for managing API requests.

### 🔐 Store Client ID, Client Secret, and API Key in a Variables File
**Objective:** Manage sensitive data securely.  
**Action:** Create a `variables.tf` file or similar to securely store your Spotify Client ID, Client Secret, and API Key. This helps avoid hardcoding credentials directly into your Terraform code.

### 📜 Create Your Playlist using Terraform HCL Code
**Objective:** Define your desired Spotify playlist and its properties.  
**Action:** Write Terraform HCL (HashiCorp Configuration Language) code to specify the playlist details, such as its name and track IDs. This allows you to manage playlist creation and updates through Terraform.

## Getting Started

### Prerequisites

- Terraform installed on your local machine.
- Docker installed to run the Spotify Auth Proxy.
- A Spotify Developer account with an app registered.

### Instructions

1. **Clone this repository:**
   ```bash
   git clone https://github.com/Nikhilshuk1a/terraform-spotify-project.git
   ```
