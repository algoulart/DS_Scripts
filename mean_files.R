# This script calculates the mean of a column on a dataset of .csv files.
# Parameters: directory_name <- The directory's name of the files
# Column: The name of the target variable.
# ID: Given the files are in a nummerical order, ID sets wich interval of them are going to be calculated.


meanFiles <- function(directory_name,column,id=1:332) {
    
    readFiles = function(id){
        files <- dir(paste('/home/GuH/Documents/DataScience/Coursera/R Programming/',directory_name,sep = ''), recursive=TRUE, full.names=TRUE, pattern="\\.csv$")
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
    
    getMean = function(column,id){
        data = makeData(id)
        res = mean(data[[column]],na.rm = TRUE)
        return(res)
    }
    return(getMean(column,id))
}

#EXAMPLE:
#mean = meanFiles("specdata","sulfate",1:30)
