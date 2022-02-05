# oneDrive backup script
library(Microsoft365R)
od <- get_personal_onedrive()
od$upload_file("staging/Bayesian_primer.pdf", dest = "Bayesian_primer.pdf")
od$upload_file("staging/cost_of_hope.pdf", dest = "cost_of_hope.pdf")