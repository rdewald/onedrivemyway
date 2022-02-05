# Please note, this is taken from
# https://cran.r-project.org/web/packages/Microsoft365R/vignettes/auth.html
# Richard DeWald - 2022-05-02

library(Microsoft365R)
od <- get_personal_onedrive()
# odb <- get_business_onedrive()

# list files and folders
od$list_items()
od$list_items("Documents")

# upload and download files
od$upload_file("somedata.xlsx")
od$download_file("Documents/myfile.docx")

# create a folder
od$create_folder("Documents/code")

# open a document for editing in Word Online
od$open_item("Documents/myfile.docx")