
% Program Parameters
nx=10;
ny=10;
left_bound=1;
right_bound=0;
interations=100;

V=rand(ny,nx);


figure(1)
for ii=1:interations
    tmpV=V;
    for jy=1:ny
        for jx=1:nx
           if(jx==1)
                V(jy,jx)=left_bound;
           elseif(jx==nx)
                V(jy,jx)=right_bound;
           elseif(jy==1)
                V(jy,jx)=tmpV(jy+1,jx);
           elseif(jy==ny)
                V(jy,jx)=tmpV(jy-1,jx);
           else
                V(jy,jx)=(tmpV(jy,jx-1)+tmpV(jy,jx+1)+tmpV(jy-1,jx)+tmpV(jy+1,jx))/4;
           end
       end
    end
    surf(V)
    view(0,90);
    pause(0.05)
    
end