function IS = sphere_project(I,camera_position,camera_angle)

alpha    = camera_position(1);
beta     = camera_position(2);
[H,W,K]  = size(I);
theta    = camera_angle/180*pi;
f        = W/(2*tan(theta/2));
sh       = round(f*pi);
sw       = round(f*2*pi);
C        = zeros(sh,sw,K);
mtx      = [cos(beta) 0 sin(beta);0 1 0;-sin(beta) 0 cos(beta)]*[1 0 0;0 cos(alpha) -sin(alpha);0 sin(alpha) cos(alpha)]; 

for yy = 1 : sh
    for xx = 1 : sw
        phi   = pi/2 - yy/f;
        the   = -(xx/f - 2*pi*floor(xx/f/pi));
        index = inv(mtx)*[sin(the)*cos(phi) sin(phi) cos(the)*cos(phi)].';
        if index(3)>0
           continue; 
        end
        idx   = index(1)/index(3)*(-f)+W/2;
        idy   = index(2)/index(3)*(-f)+H/2;
           idx = round(idx);
           idy = round(H-idy);
            if(idx<1||idy<1||idx>W||idy>H)
                continue;
            end
            for mm = 1 : K
                C(yy,xx,mm)=I(idy,idx,mm);
            end
    end
end

IS=uint8(C);

