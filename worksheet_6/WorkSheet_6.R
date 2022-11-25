#1. How many columns are in mpg dataset? How about the number of rows? Show the codes and its result.
library(dplyr)
library(ggplot2)

mpg_data <- glimpse(mpg)
mpg_data
#Output:
#Rows: 234
#Columns: 11
#$ manufacturer <chr> "audi", "audi", "audi", "audi", "audi", "audi", "audi", "audi", "a…
#$ model        <chr> "a4", "a4", "a4", "a4", "a4", "a4", "a4", "a4 quattro", "a4 quattr…
#$ displ        <dbl> 1.8, 1.8, 2.0, 2.0, 2.8, 2.8, 3.1, 1.8, 1.8, 2.0, 2.0, 2.8, 2.8, 3…
#$ year         <int> 1999, 1999, 2008, 2008, 1999, 1999, 2008, 1999, 1999, 2008, 2008, …
#$ cyl          <int> 4, 4, 4, 4, 6, 6, 6, 4, 4, 4, 4, 6, 6, 6, 6, 6, 6, 8, 8, 8, 8, 8, …
#$ trans        <chr> "auto(l5)", "manual(m5)", "manual(m6)", "auto(av)", "auto(l5)", "m…
#$ drv          <chr> "f", "f", "f", "f", "f", "f", "f", "4", "4", "4", "4", "4", "4", "…
#$ cty          <int> 18, 21, 20, 21, 16, 18, 18, 18, 16, 20, 19, 15, 17, 17, 15, 15, 17…
#$ hwy          <int> 29, 29, 31, 30, 26, 26, 27, 26, 25, 28, 27, 25, 25, 25, 25, 24, 25…
#$ fl           <chr> "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "…
#$ class        <chr> "compact", "compact", "compact", "compact", "compact", "compact", …

#2. Which manufacturer has the most models in this data set? Which model has the most variations? Ans:
man_count <- mpg_data %>% group_by(manufacturer) %>%
  count()
man_count
#Output:
##A tibble: 15 × 2
##Groups:   manufacturer [15]
#  manufacturer     n
#  <chr>        <int>
#1 audi            18
#2 chevrolet       19
#3 dodge           37
#4 ford            25
#5 honda            9
#6 hyundai         14
#7 jeep             8
#8 land rover       4
#9 lincoln          3
#10 mercury         4
#11 nissan         13
#12 pontiac         5
#13 subaru         14
#14 toyota         34
#15 volkswagen     27
colnames(man_count) <- c("Manufacturer","Counts")

# a. Group the manufacturers and find the unique models. Copy the codes and result.
grp_unique <- mpg_data %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
grp_unique
#Output:
##A tibble: 38 × 3
##Groups:   manufacturer, model [38]
#  manufacturer model                  n
#  <chr>        <chr>              <int>
#1 audi         a4                     7
#2 audi         a4 quattro             8
#3 audi         a6 quattro             3
#4 chevrolet    c1500 suburban 2wd     4
#5 chevrolet    corvette               5
#6 chevrolet    k1500 tahoe 4wd        4
#7 chevrolet    malibu                 5
#8 dodge        caravan 2wd            9
#9 dodge        dakota pickup 4wd      8
#10 dodge       durango 4wd            6
##… with 28 more rows
##ℹ Use `print(n = ...)` to see more rows

# b. Graph the result by using plot() and ggplot(). Write the codes and its result
colnames(grp_unique) <- c("Manufacturer", "Model","Counts")

#3. Same dataset will be used. You are going to show the relationship of the modeland the manufacturer.

# a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?

# b. For you, is it useful? If not, how could you modify the data to make it more informative?
ggplot(mpg, aes(model, manufacturer)) +
  geom_point() +
  geom_jitter()

#4. Using the pipe (%>%), group the model and get the number of cars per model. Show codes and its result.
grp_data <- grp_unique %>% group_by(Model) %>% count()
grp_data
#Output:
##A tibble: 38 × 2
##Groups:   Model [38]
#  Model                  n
#  <chr>              <int>
#1 4runner 4wd            1
#2 a4                     1
#3 a4 quattro             1
#4 a6 quattro             1
#5 altima                 1
#6 c1500 suburban 2wd     1
#7 camry                  1
#8 camry solara           1
#9 caravan 2wd            1
#10 civic                 1
##… with 28 more rows
##ℹ Use `print(n = ...)` to see more rows
colnames(grp_data) <- c("Model","Counts")

# a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show codes and its result.
ggplot(CarsModel[tail(order(CarsModel$n),20),],) + aes(model,fill = "color",n) +geom_bar(stat = "identity")+coord_flip()
# b. Use only the top 20 observations. Show code and results.

#5. Plot the relationship between cyl - number of cylinders and displ - engine displace- ment using geom_point with aesthetic colour = engine displacement. Title should be “Relationship between No. of Cylinders and Engine Displacement”.
ggplot(main = "Relationship between No of Cylinders and Engine Displacement",
       data = mpg , mapping = aes(x = displ, y = cyl)) + geom_point(mapping=aes(colour = "engine displacement"))

# a. Show the codes and its result.

# b. How would you describe its relationship?

#6. Get the total number of observations for drv - type of drive train (f = front-wheel drive, r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.). Plot using the geom_tile() where the number of observations for class be used as a fill for aesthetics.
ggplot(data = mpg, mapping = aes(x = drv, y = class)) + 
  geom_point(mapping=aes(color=class)) +
  geom_tile()
# a. Show the codes and its result for the narrative in #6.

# b. Interpret the result.

#7. Discuss the difference between these codes. Its outputs for each are shown below.
#• Code #1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))
#+ Code #2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")
#8. Try to run the command ?mpg. What is the result of this command?

# a. Which variables from mpg dataset are categorical?

# b. Which are continuous variables?

# c. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon). Mapped it with a continuous variable you have identified in #5-b. What is its result? Why it produced such output?

#9. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon) using geom_point(). Add a trend line over the existing plot using geom_smooth() with se = FALSE. Default method is “loess”.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE)
#10. Using the relationship of displ and hwy, add a trend line over existing plot. Set the se = FALSE to remove the confidence interval and method = lm to check for linear modeling.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm)

