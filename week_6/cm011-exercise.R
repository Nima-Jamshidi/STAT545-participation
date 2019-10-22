library("tidyverse")
library("gapminder")

view(gapminder)
write_csv(gapminder, "./gapminder.csv")

gapminder_sum <- gapminder %>% 
  group_by(continent) %>% 
  summarize(ave_lifeExp=mean(lifeExp))
write_csv(gapminder_sum, "./gapminder_sum.csv")

view(gapminder_sum)

gapminder_sum %>% 
  ggplot(aes(x=continent,y=ave_lifeExp))+
  theme_bw()

gapminder_csv <- read_csv("./gapminder_sum.csv")
ls()
remove(list=ls())
rm(list=ls())

install.packages("here")

library("here")

read_csv(here::here("test","tes","gapminder_sum.csv"))

data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"
download.file(url=data_url,destfile = paste('./datasets/',file_name))

#or
here::here()
download.file(url = data_url,destfile = here::here("week_6","greatestGivers.xls"))

#or use basename

file_name <- basename(data_url)
download.file(url = data_url,destfile = here::here("week_6",file_name),mode = "wb")

library("readxl")
philanthropists <- read_excel(here::here("week_6",file_name),trim_ws = TRUE)
philanthropists


mri_file = here("week_6","Firas-MRI.xlsx")

mri <- read_excel(mri_file, range="A1:L12")
mri <- mri[,-10]
mri <- mri %>% pivot_longer(cols='Slice 1':'Slice 8',
                            names_to = 'Slice_no',
                            values_to = 'value')
view(mri)
