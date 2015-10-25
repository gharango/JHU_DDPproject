require(fields)

pm_oxonedf <- read.csv2("pollutant.csv")

tmpcities <- as.character(unique(subset(pm_oxonedf,  City.Name %in% names(summary(pm_oxonedf$City.Name)))$City.Name))

ordCities <- tmpcities[order(tmpcities)]

pollavg <- aggregate(pm_oxonedf[, "Arithmetic.Mean"],
                     pm_oxonedf[, c("Longitude", "Latitude", "Parameter.Name", "City.Name")],
                     mean, na.rm = TRUE)        				 

pollavg$Parameter.Name <- factor(pollavg$Parameter.Name, labels = c("ozone", "pm25"))

names(pollavg)[5] <- "level"

monitors <- data.matrix(pollavg[, c("Longitude", "Latitude")])