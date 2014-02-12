Wp=[2:0.5:10];
Wn=[2:0.5:10];
DeltaV=[0.04:0.005:0.1];

numberofWp=size(Wp,2);
numberofWn=size(Wn,2);
numberofDV=size(DeltaV,2);

results=[];

for i=1:numberofWp
    for j=1:numberofWn
        for k=1:numberofDV
            [yield,tdelay,E]=MClatch(DeltaV(k),Wp(i),Wn(j));
            if yield == 1
                result = [Wp(i),Wn(j),DeltaV(k),tdelay,E];
                results = [results;result];
            end
        end
    end
end

x = results(:,3:5);

N=size(results,1);
f = zeros(N,1);


front=1;
elements = N;
while (elements > 0)
    for i=1:N
       flag = 0;
       if f(i)==0
           rowi = x(i,:);
           for j=1:N 
                if( (i ~= j) & ( (f(j) == 0 ) | (f(j) == front ) ) )
                    rowj = x(j,:);
                    
                    if( all(rowj-rowi <= 0) )
                        if(all(rowj-rowi ~= 0))
                            flag = 1;
                            break;
                        end
                    end
                    
                end
           end
           
           if(flag == 0)
               f(i) = front;
               elements = elements - 1;
           end
           
       end
    end
	front=front+1;
end

pareto = results(find(f==1),:);
            