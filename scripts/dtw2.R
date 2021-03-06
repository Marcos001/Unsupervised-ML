euclidean.dist<-function(x, y){
	sqrt((x - y)^2)
}

dtw.mat<-function(x, y){
	matriz<-matrix(0, nrow=length(x), ncol=length(y))	
	matriz[1,1] = 1
	resp<-list()
	resp$X<-length(x)
	resp$Y<-length(y)

	for(i in 1:resp$X)
		matriz[i,]<-euclidean.dist(x[i], y)

	for(i in 1:resp$X){
		for(j in 1:resp$Y){
			if(i==1 && j==1)
				matriz[i,j] = matriz[i,j]
			else
				matriz[i,j] = min(matriz[i-1,j]+matriz[i,j], 
							matriz[i, j-1]+matriz[i,j], 
							matriz[i-1, j-1]+2*matriz[i,j])
		}
	}

	resp$cost<-matriz

	dtw.path<-matrix(0, nrow=length(x), ncol=length(y))	

	i = resp$X
	j = resp$Y
	indexx<-c()
	indexy<-c()

	while(i!=1 && j!=1){
		indexx<-c(i, indexx)
		indexy<-c(j, indexy)
		dtw.path[i,j] = 1
		a = i-1
		b = j-1
		#cat("i: ", i, "j: ", j, "\n")
		if(matriz[a,b] >= matriz[i-1,j])
			b = j
		
		if(matriz[a,b] >= matriz[i, j-1])
			a = i

		i = a
		j = b
	}

	if(i > 1){
		dtw.path[1:i,1] = 1
		indexx<-c(1:i, indexx)
		indexy<-c(rep(1, length(1:i)), indexy)
	}
	if(j > 1){
		dtw.path[1,1:j] = 1
		indexy<-c(1:j, indexy)
		indexx<-c(rep(1, length(1:j)), indexx)
	}

	resp$path<-dtw.path
	resp$index1<-indexx
	resp$index2<-indexy

	resp$distance<-resp$cost[cbind(resp$index1, resp$index2)]
	resp$distance<-resp$distance[length(resp$distance)]
	#resp$distance<-sum(resp$cost[cbind(resp$index1, resp$index2)])
	resp$normDistance<-resp$distance/(resp$X+resp$Y)
	

	resp
}



#testando com dtw
# > s1<-c(1,1,2,4)
# > s2<-c(0,1,2,3,0)
# > resp<-dtw(s3, s4, step.pattern=symmetric2, keep=T)
#> resp$distance
#[1] 13
#> resp$normalizedDistance
#[1] 0.8666667

