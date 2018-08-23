euclidean.distance<-function(x, y){
	resp<-sum((x-y)^2)
	resp
}

single.link<-function(clusterA, clusterB){
	min.dist<-c()
	for(i in 1:nrow(clusterA)){
		for(j in 1:nrow(clusterB)){
			min.dist<-c(min.dist, euclidean.distance(clusterA[i,], clusterB[j,]))
		}
	}
	min(min.dist)
}

print.cluster<-function(cluster){
	print(cluster)
}

print.partition<-function(partition){
	for(i in 1:length(partition)){
		cat("\n\n\t*****Cluster: ", i, " *****\n")
		print.cluster(partition[[i]])
	}
}

hclust.sl<-function(dataset){
	clustering<-list()
	cat("Starting clustering\n")
	for(i in 1:nrow(dataset)){
		clustering[[i]]<-dataset[i,]
	}

	cat("#clusters:", length(clustering), "\n")

	print.partition(clustering)

	while(length(clustering) > 1){
		cat("\n----------Agglomerative step\n")
		min.dist<-.Machine$integer.max
		conc1<-1
		conc2<-2
		for(i in 1:(length(clustering)-1)){
			for(j in (i+1):length(clustering)){
				distance<-single.link(clustering[[i]], clustering[[j]])
				if(distance<min.dist){
					conc1<-i
					conc2<-j
					min.dist<-distance
				}
			}
		}

		cat("Concatenating clusters: [", conc1, ",", conc2, "]\n")
		temp<-rbind(clustering[[conc1]], clustering[[conc2]])
		clustering<-clustering[-c(conc1,conc2)]
		clustering[[length(clustering)+1]]<-temp
		cat("#clusters:", length(clustering), "\n")
		print.partition(clustering)
	}
}
