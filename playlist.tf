resource "spotify_playlist" "Playlist_created_using_Terraform" {
    name = "Playlist created using Terraform"
    tracks = ["3e7sxremeOE3wTySiOhGiP","0dJacN6K3mSGLE9p7QE0lO","1DIXPcTDzTj8ZMHt3PDt8p","6mt8Bt9aHHCfbTBJMAcceJ","08bNPGLD8AhKpnnERrAc6G"]
}

data "spotify_search_track" "KK" {
    artist = "KK"
}

resource "spotify_playlist" "Songs_by_kk" {
    name = "Best Songs of KK"
    tracks = [data.spotify_search_track.KK.tracks[0].id,data.spotify_search_track.KK.tracks[1].id,
    data.spotify_search_track.KK.tracks[2].id,data.spotify_search_track.KK.tracks[3].id,
    data.spotify_search_track.KK.tracks[4].id]
}