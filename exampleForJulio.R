#### PRACTICE SCRIPT ###########################################################
install.packages("magrittr")
install.packages("tidyverse")
library("magrittr")
library("tidyverse")

### Getting the dataset ########################################################
## Using regular function expressions ##########################################
dendrogram <- plot(hclust(dist(select(read.csv("mall_customers.csv"), 
                                      annual.income, spending.score)), 
                          method = "ward.D"), 
                   main = "Dendrogram", xlab = "Customers", 
                   ylab = "Euclidean Distance")
# Notice how this is confusing? The formula is read from inside out.
# To combat this, you can use PIPING. This essentially makes the function
# go from y -> f(x) to f(x,y). Easier for us math types, right?

## Using the pipe operator %>% #################################################
dendrogram <-
    read.csv("mall_customers.csv") %>%
    select(annual.income, spending.score) %>%
    dist %>%
    hclust(method = "ward.D") %>%
    plot(main = "Dendrogram", xlab = "Customers", ylab = "Euclidean Distance")
# Writing code in this way takes up essentially the same amount of space, but
# someone coming after you will be able to see what you're doing much more
# easily. In "human" terms, %>% is spoken as "then". Per esempio:

# dendrogram is equal to
#     read the file you're going to import, then
#     select the columns you want from the file, then
#     calculate the distance between those two variables, then
#     determine the hclusters based on that distance, then
#     plot and print the result

