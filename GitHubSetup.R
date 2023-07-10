install.packages("usethis")
library(usethis)

## set your name and email
usethis::use_git_config(user.name = "Rohan Manoj",
                        user.email = "rohanmanoj205@gmail.com")

## create a personal access token (PAT) for authentication
usethis::create_github_token()

