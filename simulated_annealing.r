# library import
library(GenSA)


# data loading
setwd('/')
miscolc <- read.csv(file = 'miscolc.csv')

#assembly size
N <- 50

#gender, age, education and area sizes declaration
N_WOMAN <- 27
N_MAN <- 23

N_18 <- 6
N_30 <- 18
N_50 <- 12
N_65 <- 14

N_PRIMARY <- 16
N_MEDIUM <- 21
N_HIGHER <- 13

N_A_1 <- 1
N_A_2 <- 2
N_A_3 <- 1
N_A_4 <- 1
N_A_5 <- 1
N_A_6 <- 1
N_A_7 <- 3
N_A_8 <- 4
N_A_9 <- 3
N_A_10 <- 1
N_A_11 <- 2
N_A_12 <- 7
N_A_13 <- 4
N_A_14 <- 3
N_A_15 <- 4
N_A_16 <- 3
N_A_17 <- 5
N_A_18 <- 4

#current iteration checking parameter
check_par <- 0

# input entries size
INPUT_SIZE <- nrow(miscolc)


#evaluation function declaration
#v - vectors
#b - is that out of genSA call?
evaluation_function <- function(v,b) {
  
  ret <- 0
  if(any(duplicated(miscolc$ID[v]))){
    ret <- 99999999
  }else{
    
    #variables declarations
    man <- 0
    woman <- 0
    
    age18 <- 0
    age30 <- 0
    age50 <- 0
    age65 <- 0
    
    primary <- 0	
    medium <- 0
    higher <- 0
    
    a1 <- 0
    a2 <- 0
    a3 <- 0
    a4 <- 0
    a5 <- 0
    a6 <- 0
    a7 <- 0
    a8 <- 0
    a9 <- 0
    a10 <- 0
    a11 <- 0
    a12 <- 0
    a13 <- 0
    a14 <- 0
    a15 <- 0
    a16 <- 0
    a17 <- 0
    a18 <- 0
    
    #counters
    for (i in 1:length(v)) {
      
      if (miscolc$Gender[v[i]] == "M") {
        man <- man+1
      } else if (miscolc$Gender[v[i]] == "F") {
        woman <- woman+1
      }		
      
      if (miscolc$Age[v[i]] == "18-29") {
        age18 <- age18+1
      } else if (miscolc$Age[v[i]] == "30-49") {
        age30 <- age30+1
      } else if (miscolc$Age[v[i]] == "50-64") {
        age50 <- age50+1
      } else if (miscolc$Age[v[i]] == "65+") {
        age65 <- age65+1
      }
      
      if (miscolc$Education[v[i]] == "elementary school") {
        primary <- primary+1
      } else if (miscolc$Education[v[i]] == "high school") {
        medium <- medium+1
      } else if (miscolc$Education[v[i]] == "university") {
        higher <- higher+1
      }
      
      if (miscolc$area[v[i]] == "area_1") {
        a1 <- a1+1
      }else if(miscolc$area[v[i]] == "area_2") {
        a2 <- a2+1
      }else if(miscolc$area[v[i]] == "area_3") {
        a3 <- a3+1
      }else if(miscolc$area[v[i]] == "area_4") {
        a4 <- a4+1
      }else if(miscolc$area[v[i]] == "area_5") {
        a5 <- a5+1
      }else if(miscolc$area[v[i]] == "area_6") {
        a6 <- a6+1
      }else if(miscolc$area[v[i]] == "area_7") {
        a7 <- a7+1
      }else if(miscolc$area[v[i]] == "area_8") {
        a8 <- a8+1
      }else if(miscolc$area[v[i]] == "area_9") {
        a9 <- a9+1
      }else if(miscolc$area[v[i]] == "area_10") {
        a10 <- a10+1
      }else if(miscolc$area[v[i]] == "area_11") {
        a11 <- a11+1
      }else if(miscolc$area[v[i]] == "area_12") {
        a12 <- a12+1
      }else if(miscolc$area[v[i]] == "area_13") {
        a13 <- a13+1
      }else if(miscolc$area[v[i]] == "area_14") {
        a14 <- a14+1
      }else if(miscolc$area[v[i]] == "area_15") {
        a15 <- a15+1
      }else if(miscolc$area[v[i]] == "area_16") {
        a16 <- a16+1
      }else if(miscolc$area[v[i]] == "area_17") {
        a17 <- a17+1
      }else if(miscolc$area[v[i]] == "area_18") {
        a18 <- a18+1
      }
      
    }
    
    
    
    #calculating the ideal composition - evaluation for checking parameter
    check_par <- (N_MAN-man)^2 + (N_WOMAN-woman)^2 + (N_18-age18)^2 + (N_30-age30)^2 + (N_50-age50)^2 + (N_65-age65)^2 + (N_PRIMARY-primary)^2 + (N_MEDIUM-medium)^2 + (N_HIGHER-higher)^2 +(N_A_1-a1)^2+(N_A_2-a2)^2+(N_A_3-a3)^2+(N_A_4-a4)^2+(N_A_5-a5)^2+(N_A_6-a6)^2+(N_A_7-a7)^2+(N_A_8-a8)^2+(N_A_9-a9)^2+(N_A_10-a10)^2+(N_A_11-a11)^2+(N_A_12-a12)^2+(N_A_13-a13)^2+(N_A_14-a14)^2+(N_A_15-a15)^2+(N_A_16-a16)^2+(N_A_17-a17)^2+(N_A_18-a18)^2
    
    #results evaluation
    ret <- ret + (N_MAN-man)^2 + (N_WOMAN-woman)^2 + (N_18-age18)^2 + (N_30-age30)^2 + (N_50-age50)^2 + (N_65-age65)^2 + (N_PRIMARY-primary)^2 + (N_MEDIUM-medium)^2 + (N_HIGHER-higher)^2 +(N_A_1-a1)^2+(N_A_2-a2)^2+(N_A_3-a3)^2+(N_A_4-a4)^2+(N_A_5-a5)^2+(N_A_6-a6)^2+(N_A_7-a7)^2+(N_A_8-a8)^2+(N_A_9-a9)^2+(N_A_10-a10)^2+(N_A_11-a11)^2+(N_A_12-a12)^2+(N_A_13-a13)^2+(N_A_14-a14)^2+(N_A_15-a15)^2+(N_A_16-a16)^2+(N_A_17-a17)^2+(N_A_18-a18)^2
    
    #current loop evaluation
    if(check_par==0 && ret<99999999){
      print("Identificatiors list:")
      print( miscolc$ID[v] )
      print("Characteristics amounts:")
      print( cat('man=', man, ' woman=', woman,'age18=', age18, ' age30=', age30,'age50=', age50, ' age65=', age65,' primary=', primary, ' medium=', medium, ' higher=', higher,' area1=',a1,' area2=',a2,' area3=',a3,' area4=',a4,' area5=',a5,' area6=',a6,' area7=',a7,' area8=',a8,' area9=',a9,' area10=',a10,' area11=',a11,' area12=',a12,' area13=',a13,' area14=',a14,' area15=',a15,' area16=',a16,' area17=',a17,' area18=',a18) )
      write.csv(cbind(miscolc$LP[v],miscolc$ID[v]),'result_1.csv',row.names = TRUE)
      
      #stop genSA - ideal composition found
      stop("Result found. Function execution stopped.")
    }
    
  }
  
  #data output presentation
  if (b) {
    print("Identificatiors list:")
    print( miscolc$ID[v] )
    print("Characteristics amounts:")
    print( cat('man=', man, ' woman=', woman,'age18=', age18, ' age30=', age30,'age50=', age50, ' age65=', age65,' primary=', primary, ' medium=', medium, ' higher=', higher,' area1=',a1,' area2=',a2,' area3=',a3,' area4=',a4,' area5=',a5,' area6=',a6,' area7=',a7,' area8=',a8,' area9=',a9,' area10=',a10,' area11=',a11,' area12=',a12,' area13=',a13,' area14=',a14,' area15=',a15,' area16=',a16,' area17=',a17,' area18=',a18) )
    write.csv(cbind(miscolc$LP[v],miscolc$ID[v]),'result_1.csv',row.names = TRUE)
  }
  
  ret
}

#simulated annealing
RESULT <- GenSA(par=as.numeric(sample(1:N)*INPUT_SIZE/N), fn=evaluation_function, lower=as.numeric(seq(1,N)), upper=as.numeric(seq(INPUT_SIZE-N+1,INPUT_SIZE)), FALSE, control=list(max.time=3000,smooth=FALSE,verbose=TRUE,temperature=50.0))
print(RESULT)

#main function
evaluation_function(RESULT$par, TRUE)


