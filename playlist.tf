resource "spotify_playlist" "Playlist_created_using_Terraform" {
    name = "Playlist created using Terraform"
    tracks = ["3e7sxremeOE3wTySiOhGiP","0dJacN6K3mSGLE9p7QE0lO","1DIXPcTDzTj8ZMHt3PDt8p","6mt8Bt9aHHCfbTBJMAcceJ","08bNPGLD8AhKpnnERrAc6G"]
}
# Make sure you copy track id from spotify which looks like "https://open.spotify.com/track/<Your Track ID>"
# If you use track ID which looks like https://open.spotify.com/playlist/<Track ID> OR https://open.spotify.com/album/<Track ID> 
# This will not Add your Song to your Playlist because type is different, it should be Track.

data "spotify_search_track" "KK" {
    artist = "KK"
} # searching tracks based on the artist

resource "spotify_playlist" "Songs_by_kk" {
    name = "Best Songs of KK"
    tracks = [data.spotify_search_track.KK.tracks[0].id,data.spotify_search_track.KK.tracks[1].id,
    data.spotify_search_track.KK.tracks[2].id,data.spotify_search_track.KK.tracks[3].id,
    data.spotify_search_track.KK.tracks[4].id]
} # using data block to provide songs of an artist, used here in tracks in the form of array