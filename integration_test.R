# This is a crude integration test for the jasmines/rosemary packages.
# the idea is that the "images" folder contains canonical versions
# of the images, created by an earlier version of jasmines/rosemary.
# We then run `rosemary::build_all(clean = TRUE)` to build new versions
# in the "temp" folder. If the images have remained stable I assume
# that the new version of jasmines/rosemary hasn't broken anything.
# At some point I'll write proper unit tests... sigh.

# build all takes time
#rosemary::build_all(clean = TRUE)

# yeah, yeah, it's not robust...
tmp_dir <- "~/Dropbox/personal/Artwork/temp"
img_dir <- "~/Dropbox/personal/Artwork/images"

# extract the file names in each folder
new_files <- list.files(tmp_dir)
old_files <- list.files(img_dir)

# check that there are the same number of files
num_new_files <- length(new_files)
num_old_files <- length(old_files)
if(num_new_files != num_old_files) {
  stop("number of files is not the same", call. = FALSE)
}

# check that they all have the same names
if(!(all(new_files == old_files))) {
  stop("file names are not the same", call. = FALSE)
}

# get info about both file sets
new_file_info <- file.info(list.files(tmp_dir, full.names = TRUE))
old_file_info <- file.info(list.files(img_dir, full.names = TRUE))

# what about file sizes?
new_sizes <- new_file_info[,"size"]
old_sizes <- old_file_info[,"size"]
diff <- new_sizes - old_sizes
names(diff) <- new_files
diff <- diff[diff != 0]
print(diff)

