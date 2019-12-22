
clean_dir <- function(dir) {
  if(dir.exists(dir)) {unlink(dir, recursive = TRUE)}
  dir.create(dir)
}

clean_dir(here::here("temp"))

purrr::walk(
  .x = list.files(here::here("source"), full.names = TRUE),
  .f = function(.x) {
    build <- function(.x) {source(.x, local = TRUE)}
    cat(.x, "\n");
    build(.x)
  }
)

# extract the file names in each folder
new_files <- list.files(here::here("temp"))
old_files <- list.files(here::here("images"))

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
new_file_info <- list.files(here::here("temp"), full.names = TRUE) %>% file.info()
old_file_info <- list.files(here::here("images"), full.names = TRUE) %>% file.info()

# what about file sizes?
new_sizes <- new_file_info[,"size"]
old_sizes <- old_file_info[,"size"]
diff <- new_sizes - old_sizes
names(diff) <- new_files
diff <- diff[diff != 0]
print(diff)

