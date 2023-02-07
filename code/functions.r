# ------------------------36. define_a_function------------------------
## Define a function

find_monthly_max_temp = function(month) {
  airquality %>% 
    filter(Month == month) %>% 
    summarize(max(Temp))
}

find_monthly_max_temp(5)
find_monthly_max_temp(6)


# ------------------------37. multiple-inputs_default-inputs------------------------
## Define a function with multiple input arguments & default values for a function

find_monthly_max_temp = function(df = airquality, month) {
  df %>% 
    filter(Month == month) %>% 
    summarize(max(Temp))
}

find_monthly_max_temp(airquality, 5)
find_monthly_max_temp(month = 5, df = airquality)
find_monthly_max_temp(month=5)


# ------------------------38. function-env_function-output------------------------
## Function output

adding = function(x, y){
  x + y
}

adding(5, 2)

adding = function(x, y){
  s = x + y
}

adding(5, 2)

adding = function(x, y){
  s = x + y
  return(s)
}

adding(5, 2)


## Function environment v.s. global environment

adding_x = function(y) {
  x = 2
  x + y
}

adding_x(y = 10)

adding_x = function(y) {
  x = 2
  x + y
}

x = 20

adding_x(y = 10)


adding_x = function(y) {
  x + y
}

x = 20

adding_x(y = 10)