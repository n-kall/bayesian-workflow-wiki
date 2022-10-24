# requirements 
if(!requireNamespace("pacman"))install.packages("pacman")
# pacman loads + installs if not installed 
pacman::p_load(here, fs, brms)

# create Stan files from brms::make_stancode and store for later use 

write_brms_stan <- function(formula, data, family, prior = NULL, modelname = "model", ...){
  # stan code from brms, dots allow to add additional arguments of make_stancode()
  lines <- brms::make_stancode(formula, data, family, prior, ...)
  # create directory (if it does not exist)
  dir <- fs::dir_create("Stan")
  # write lines to .stan stored in directory 
  writeLines(lines, here::here(dir, paste0(modelname, ".stan")))
}
