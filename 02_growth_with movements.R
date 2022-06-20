# Geometric growth with movement along a one-dimensional space
# Individuals can move 1 cell left or right per time step
# d is the movement rate: proportion of individuals that move in any direction
# lambda is discrete rate of growth (1+R)
growth_and_movement1d <- function(N0, lambda, d, tmax = 100){
  dynamics <- array(NA, dim = c(tmax*2+1, tmax*2+1))
  dynamics[1,] <- 0
  dynamics[1,tmax+1] <- N0
  for (t in c(1:tmax)){
    N <- dynamics[t,]
    growth <- N * lambda
    emmigration <- N * 2*d
    immigration_right <- c(N[c(2:ncol(dynamics))] * d, 0)
    immigration_left <- c(0, N[c(1:(ncol(dynamics)-1))] * d)
    dynamics[t+1,] <- N + growth - emmigration + immigration_left + immigration_right
  }
  return(dynamics)
}

# Geometric growth with movement along a two-dimensional space
# Individuals can move 1 cell left, right, up or down per time step
# d is the movement rate: proportion of individuals that move in any direction
# lambda is discrete rate of growth (1+R)
growth_and_movement2d <- function(N0, lambda, d, tmax = 100){
  dynamics <- array(NA, dim = c(tmax*2+1, tmax*2+1, tmax+1))
  dynamics[,,1] <- 0
  dynamics[tmax+1,tmax+1,1] <- N0
  for (t in c(1:tmax)){
    N <- dynamics[,,t]
    growth <- N * lambda
    emmigration <- N * 4* d
    immigration_right <- cbind(N[,c(2:dim(dynamics)[2])] * d, 0)
    immigration_left <- cbind(0, N[,c(1:(dim(dynamics)[2]-1))] * d)
    immigration_up <- rbind(0, N[c(1:(dim(dynamics)[1]-1)),] * d)
    immigration_down <- rbind(N[c(2:(dim(dynamics)[1])),] * d, 0)
    dynamics[,,t+1] <- N + growth - emmigration + immigration_left + immigration_right + immigration_up + immigration_down
  }
  return(dynamics)
}

# The radius of the population for each timestep (2d)
radius <- function(dynamics){
  center <- ceiling(dim(dynamics)[2]/2)
  apply(dynamics[,center,] > 1, MARGIN = 2, sum) / 2
}

# The area covered by the population for each timestep (2d)
area <- function(dynamics){
  apply(dynamics > 1, MARGIN = 3, sum)
}

# The number of cell occupied by the population (1d)
cell_occupied <- function(dynamics){
  apply(dynamics > 1, MARGIN=1, sum)
}
