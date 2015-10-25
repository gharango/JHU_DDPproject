

pollutant <- function(distance1,city1, distance2,  city2) {
        pair1 <- subset(pm_oxonedf,City.Name == city1)[1,]
        pair1$City.Name = as.character(pair1$City.Name)
        pair2 <- subset(pm_oxonedf,City.Name == city2)[1,]
        pair2$City.Name = as.character(pair2$City.Name)
        longitudes <- c(pair1$Longitude,pair2$Longitude)
        latitudes <- c(pair1$Latitude,pair2$Latitude)
        
        df <- data.frame(lon = longitudes, lat = latitudes, radius = as.numeric(c(distance1,distance2)), 
                         city = c(pair1$City.Name,pair2$City.Name))
        X <- data.matrix(df[, c("lon", "lat")])
        r <- df$radius
        d <- rdist.earth(monitors, X)
        use <- lapply(seq_len(ncol(d)), function(i) {
                which(d[, i] < r[i])
        })
        levels <- sapply(use, function(idx) {
                with(pollavg[idx, ], tapply(level, Parameter.Name, mean))
        })
        dlevel <- as.data.frame(t(levels))
        data.frame(latlon=paste(df[,"lat"], df[,"lon"], sep=":"), 
		 tooltip=paste(df$city,paste(names(dlevel)[1],paste(dlevel[,1],
                 paste(names(dlevel)[2],dlevel[,2],sep=" "),sep=" "),sep=" "),sep=" "),
                 radius=df$radius)
        }

googleVisChart <- function(r){
        gvisGeoChart(r, locationvar="latlon", colorvar="radius", hovervar="tooltip",
                           options=list(region="US", 
                                        displayMode="markers", 
                                        resolution="provinces",
                                        width=600, height=400)    									
        )
}

googleVisPlot <- function(chart){
        plot(chart)
}