# Author: Cynthia Elder
# Date: 7/4/2020

# Helper function to download a file from a URL
download_file <- function(dir, file_url, dest_file) {
  if (!file.exists(dir)) {dir.create(dir)}
  if (!file.exists(dest_file)) {
    download.file(url = file_url, destfile = dest_file, method = "curl")
  }
}
