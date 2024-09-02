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


## Steps to Follow

### Step 1: Create a Spotify Developer App

1. **Login to the Spotify Developer Dashboard**:
   - Visit the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/) and log in with your Spotify account.

2. **Create a New App**:
   - Click the green **Create an app** button.
   - Fill out the form with the following details:
     - **Name**: `Terraform Playlist Demo`
     - **Description**: `Create a Spotify playlist using Terraform.`
   - Check the box to agree to the terms of service and click **Create**.

3. **Configure Redirect URI**:
   - Click the green **Edit Settings** button on the top right.
   - Add the following URI in the **Redirect URI** field: `**http://localhost:27228/spotify_callback**`
   - Click **Add** and then **Save** to update the settings.

### Step 2: Run Authorization Server

1. **Set Environment Variables**:
   - In your terminal, set the redirect URI environment variable:
     ```bash
     export SPOTIFY_CLIENT_REDIRECT_URI=http://localhost:27228/spotify_callback
     ```

2. **Create `.env` File**:
   - Create a file named `.env` with the following contents to store your Spotify app's Client ID and Secret:
     ```env
     SPOTIFY_CLIENT_ID=<Your_Client_ID>
     SPOTIFY_CLIENT_SECRET=<Your_Client_Secret>
     ```
   - Replace `<Your_Client_ID>` and `<Your_Client_Secret>` with your actual Spotify app credentials from the developer dashboard.

3. **Run the Spotify Auth Proxy**:
   - Ensure Docker Desktop is running.
   - Start the Spotify authorization proxy server:
     ```bash
     docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy
     ```
   - The server will display an output including an `APIKey`, `Token`, and `Auth` URL. Open the `Auth` URL in your browser and authenticate with Spotify.

4. **Authorization**:
   - After authenticating, the server will display **Authorization successful**. This means the Terraform provider can now use the server to retrieve access tokens.

### Step 3: Clone Example Repository

1. **Clone the Repository**:
   - Clone the example Terraform configuration repository:
     ```bash
     git clone https://github.com/Nikhilshuk1a/terraform-spotify-project.git
     ```

### Step 4: Explore the Configuration

1. **Open `provider.tf`**:
   - The `provider.tf` file contains Terraform configuration to specify *_Spotify Provider_* . Key blocks include:

   - **Terraform Configuration**:
     ```hcl
     terraform {
       required_providers {
         spotify = {
           version = "~> 0.1.5"
           source  = "conradludgate/spotify"
         }
       }
     }

     provider "spotify" {
       api_key = var.spotify_api_key
     }
     ```

   - **Search for Songs Using Artist in Data Block in _playlist.tf_ **:
     ```hcl
     data "spotify_search_track" "by_artist" {
       artists = ["kk"]
     }
     ```

   - **Create a Playlist**:
     ```hcl
     resource "spotify_playlist" "playlist" {
       name        = "Playlist created using Terraform"
       description = "This playlist was created by Terraform"
       public      = true

       tracks = [
         data.spotify_search_track.by_artist.tracks[0].id,
         data.spotify_search_track.by_artist.tracks[1].id,
         data.spotify_search_track.by_artist.tracks[2].id,
       ]
     }
     ```

2. **Outputs**:
   - Open `outputs.tf` to see how to define an output value for the URL of the playlist:
     ```hcl
     output "playlist_url" {
       value       = "https://open.spotify.com/playlist/${spotify_playlist.playlist.id}"
       description = "Visit this URL in your browser to listen to the playlist"
     }
     ```

### Step 5: Set the API Key

1. **Configure API Key**:
   - Rename `terraform.tfvars.example` to `terraform.tfvars`:
     ```bash
     mv terraform.tfvars.example terraform.tfvars
     ```

2. **Add API Key**:
   - Open `terraform.tfvars` and replace `...` with your `APIKey` from the proxy server output:
     ```hcl
     spotify_api_key = "..."
     ```

### Step 6: Initialize and Apply Terraform

1. **Initialize Terraform**:
   - Run the following command to initialize Terraform and install the Spotify provider:
     ```bash
     terraform init
     ```

2. **Plan the Terraform Configuration**:
   - Test the Terraform file by first using Terraform Plan in the Terminal:
     ```bash
     terraform plan
     ```

3. **Apply the Terraform Configuration**:
   - Create the playlist by applying the configuration:
     ```bash
     terraform apply
     ```
   - Confirm with `yes` to apply the changes.

### Step 7: Verify Your Playlist

- After applying the Terraform configuration, you should see the changes on spotify :
- 
Outputs:

playlist_url = "https://open.spotify.com/playlist/<playlist_ID>"

- Visit the URL to view your new Spotify playlist!

<!--## Warning

Never commit sensitive values, like your Spotify API key, to version control. Use `.gitignore` to exclude files with sensitive information.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with any improvements or suggestions.


----->

Enjoy creating your Spotify playlists with Terraform! 🎵

