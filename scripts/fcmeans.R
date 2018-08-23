euclidean.distance<-function(x, y){
	sqrt(sum((x-y)^2))
}

init.members<-function(ncols=2, nrows=2){
	members<-matrix(ncol=ncols, nrow=nrows)
	for(i in 1:nrows){
		end = 1
		for(j in 1:(ncols-1)){
			members[i,j]<-runif(n=1, min=0, max=end)
			end = end-members[i,j]
		}
		members[i,ncols]<-end
	}
	members
}

fuzzy.cmeans<-function(ngroups=2, data, fuzzy.factor=2.5, threshold=0.01){
	ndata<-nrow(data)
	members<-init.members(ncol=ngroups, nrow=ndata)

	centers<-list()

	error=1

	while(error > threshold){
		#update center
		for(i in 1:ngroups){
			temp<-members[,i]^fuzzy.factor
			centers[[i]]<-(colSums(temp*data))/sum(temp)
		}

		#update membership
		new.members<-matrix(0,ncol=ngroups, nrow=ndata)
		for(i in 1:ndata){
			for(j in 1:ngroups){
				#new.members[i,j]<-new.members[i,j]+(euclidean.distance(data[i,], centers[[i]])/euclidean.distance(data[i,], centers[[j]]))^(1/(m-1))
				for(k in 1:ngroups){
					new.members[i,j]<-new.members[i,j]+(euclidean.distance(data[i,], centers[[j]])/euclidean.distance(data[i,], centers[[k]]))^(1/(m-1))
				}
			}
		}

		new.members<-1/new.members

		error = max(abs(new.members-members))
		members = new.members
	}
	members
}

