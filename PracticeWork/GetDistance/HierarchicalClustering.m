 function [distance_matrix,cluster_pairs]=HierarchicalClustering(data_matrix)%distance:Euclid; clustering method: furthest distance.
         total_scale=length(data_matrix(:,1));
        distance_matrix=zeros(total_scale,total_scale);
        for i=1:(total_scale-1)
            for j=2:total_scale
                distance_matrix(i,j)=norm(data_matrix(i,:)-data_matrix(j,:));
                distance_matrix(j,i)=distance_matrix(i,j);
            end
        end
        distance_matrix=cat(1,linspace(1,total_scale,total_scale),distance_matrix);
        distance_matrix=cat(2,linspace(0,total_scale,total_scale+1)',distance_matrix);
        cluster_pairs=zeros(total_scale-1,3);
 
        total_scale=total_scale+1;
        current_scale=total_scale;
        for j=1:(total_scale-2)
            
            tmp=Inf;pi=0;pj=0;
            for i=2:(total_scale-1)
                for j=(i+1):total_scale
                    if(distance_matrix(i,j)<tmp)
                        tmp=distance_matrix(i,j);
                        pi=i;
                        pj=j;
                    end
                end
            end
            
            if(distance_matrix(pi,1)<distance_matrix(pj,1))
            cluster_pairs(j,:)=[distance_matrix(pi,1),distance_matrix(1,pj),tmp];
            else
             cluster_pairs(j,:)=[distance_matrix(pj,1),distance_matrix(1,pi),tmp];
            end
            distance_matrix(pi,:)=max(distance_matrix(pi,:),distance_matrix(pj,:));%metric definition;
            distance_matrix(pi,1)=current_scale;
            distance_matrix(:,pi)=distance_matrix(pi,:)';
            if(pj==total_scale)
                distance_matrix=distance_matrix(1:(end-1),1:(end-1));
            else
                tmp_matrix=cat(2,distance_matrix(1:(pj-1),1:(pj-1)),distance_matrix(1:(pj-1),(pj+1):total_scale));
                distance_matrix=cat(1,tmp_matrix,cat(2,distance_matrix((pj+1):total_scale,1:(pj-1)),distance_matrix((pj+1):total_scale,(pj+1):total_scale)));
            end
            current_scale=current_scale+1;
            total_scale=total_scale-1;
        end
    end


