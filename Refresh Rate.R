#To serve as a proxy for connectivity (important in development economies), let's try to write code for
#the refresh rate of street imagery.
#https://analyticsindiamag.com/deep-dive-how-avis-india-is-betting-big-on-data-connected-vehicles-to-lead-the-car-rental-space/
#https://www.mapmyindia.com/

#Can we build a statistical model like Henderson did for night lights?
#https://www.nber.org/papers/w15199.pdf


#Working with Google Street View
#Note that this feature isn't allowed in India, so we'll have to try it on a neighboring Asian economy
#https://en.wikipedia.org/wiki/Google_Street_View_in_Asia#_India

system.time({
  n <- 1000
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})

#Combining imagery code for license plate recognition (which is now in Python)


