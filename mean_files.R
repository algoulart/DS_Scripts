pollutantmean <- function(directory,pollutant,id=1:332) {
    
    readFiles = function(id){
        files <- dir(paste('/home/GuH/Documents/DataScience/Coursera/R Programming/',directory,sep = ''), recursive=TRUE, full.names=TRUE, pattern="\\.csv$")
        return(files[id])
    }

    makeData = function(id){
        a = readFiles(id)
        
        data = read.csv(a[1])
        for(i in id[2]:length(id)){
            data = rbind(data,read.csv(a[i]))
        }
        return(data)
    }
    
    getMean = function(pollutant,id){
        data = makeData(id)
        res = mean(data[[pollutant]],na.rm = TRUE)
        return(res)
    }
    return(getMean(pollutant,id))
}

res = pollutantmean("specdata","sulfate",1:30)
