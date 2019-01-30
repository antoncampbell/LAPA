
% Program Parameters
nx=20;
ny=20;
left_bound=1;
right_bound=1;
top_bound=0;
bottom_bound=0;
interations=200;

V=rand(ny,nx);
%Ex=zeros(ny,nx);


for ii=1:interations
    tmpV=V;
    for jy=1:ny
        for jx=1:nx
           if(jx==1)
                V(jy,jx)=left_bound;
           elseif(jx==nx)
                V(jy,jx)=right_bound;
           elseif(jy==1)
                V(jy,jx)=top_bound;
                %V(jy,jx)=tmpV(jy+1,jx);
           elseif(jy==ny)
                V(jy,jx)=bottom_bound;
                %V(jy,jx)=tmpV(jy-1,jx);
           else
                V(jy,jx)=(tmpV(jy,jx-1)+tmpV(jy,jx+1)+tmpV(jy-1,jx)+tmpV(jy+1,jx))/4;
           end
       end
    end
    [Ex,Ey]=gradient(V);
    

    figure(1)
    surf(V)
    view(0,90);
    
    figure(2)
    Emag=sqrt(Ex.^2+Ey.^2);
    surf(Emag)
    
    figure(3)
    quiver(Ex,Ey)
    
    
    pause(0.001)
    
end