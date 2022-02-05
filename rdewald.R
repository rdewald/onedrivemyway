# oneDrive backup script
# 
library(Microsoft365R)
od <- get_personal_onedrive()
uploads <- list.files(Sys.getenv("ODMW_staging"))
paste("staged for upload: ", uploads[])
for (i in seq_along(uploads)) { 
  od$upload_file(paste0(Sys.getenv("ODMW_staging")
                        , "/"
                        , stringr::str_trim(uploads[i]))
                 , dest = paste0(Sys.getenv("ODMW_dest")
                                 , "/"
                                 , stringr::str_trim(uploads[i]))
  )
}
