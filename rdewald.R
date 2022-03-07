# oneDrive backup script
# 
library(Hmisc)
library(Microsoft365R)
od <- get_personal_onedrive()
stage_dir <- Sys.getenv("ODMW_staging")
win.stage_dir <- paste0(stage_dir)
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
shell(paste("dir", stage_dir))
for (i in seq_along(uploads)) { 
    buhbye <- paste0('del '
                     , stage_dir
                     , "\\'"
                     , uploads[i]
                    )
    shell(buhbye)
  }

