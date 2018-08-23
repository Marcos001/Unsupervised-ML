manhattan.dist<-function(x, y){
  sum(abs(x-y))
}

#data is the own data
#medoids are a list of indeces of every medoids (which is a set of real data)
distanceToMedoid<-function(data, medoids){
  distMatrix<-matrix(nrow=nrow(data), ncol=length(medoids))
  for(i in 1:length(medoids))
    distMatrix[,i] = apply(data, 1, manhattan.dist, y=data[medoids[i],])
  
  distMatrix
}

pam.cluster<-function(data, k){
	centers = sample(nrow(data),k)
	distMat = distanceToMedoid(data, centers)
	clusters = apply(distMat, 1, which.min)
	min.dist = sum(apply(distMat, 1, min))

	while(TRUE){
		new.centers = c()
		for(i in 1:k){
			#DOHHH...not so smart new center choice... 
			new.centers[i] = sample(which(clusters == i), 1)
		}

		distMat = distanceToMedoid(data, new.centers)
		new.clusters = apply(distMat, 1, which.min)
		new.dist = sum(apply(distMat, 1, min))

		if(new.dist < min.dist){
			clusters = new.clusters	
			centers = new.centers
			min.dist = new.dist
		}else if(new.dist == min.dist){
			break
		}
	}

	resp<-list()
	resp$cluster=clusters
	resp$center=centers

	resp
}
