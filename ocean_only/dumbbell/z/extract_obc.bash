#!/bin/bash
# Extract boundary conditions for the child domain from the output of
# the parent domain.

ncks -O -d xq,41,41 -v u prog.nc west.nc
ncks -d xh,41,41 -v SSH -A  prog.nc west.nc
ncks -d xh,41,41 -v salt -A  prog.nc west.nc
ncks -d xh,41,41 -v h -A  prog.nc west.nc
ncks -d xh,41,41 -v v -A  prog.nc west.nc
ncatted -a modulo,Time,c,c,' ' west.nc
ncrename -v u,u_segment_001 west.nc
ncrename -v SSH,zeta_segment_001 west.nc
ncrename -v h,dz_u_segment_001 west.nc
ncks -d xh,41,41 -v h -A  prog.nc west.nc
ncrename -v salt,salt_segment_001 west.nc
ncrename -v v,v_segment_001 west.nc
# Change this if changing DUMBBELL_FRACTION
ncks -d xh,41,41 -v v -A  prog.nc west.nc
ncap2 -A -s 'v(:,:,0:1,:)=0; v(:,:,19:20,:)=0; v(:,:,2,:)=h(:,:,2,:); v(:,:,18,:)=h(:,:,17,:); v(:,:,3:17,:)=0.5*(h(:,:,2:16,:)+h(:,:,3:17,:))' west.nc west.nc
ncrename -v h,dz_salt_segment_001 west.nc
ncrename -v v,dz_v_segment_001 west.nc

ncks -O -d xq,81,81 -v u prog.nc east.nc
ncks -d xh,82,82 -v SSH -A  prog.nc east.nc
ncks -d xh,82,82 -v salt -A  prog.nc east.nc
ncks -d xh,82,82 -v h -A  prog.nc east.nc
ncks -d xh,82,82 -v v -A  prog.nc east.nc
ncatted -a modulo,Time,c,c,' ' east.nc
ncrename -v u,u_segment_002 east.nc
ncrename -v SSH,zeta_segment_002 east.nc
ncrename -v h,dz_u_segment_002 east.nc
ncks -d xh,82,82 -v h -A  prog.nc east.nc
ncrename -v salt,salt_segment_002 east.nc
ncrename -v v,v_segment_002 east.nc
# Change this if changing DUMBBELL_FRACTION
ncks -d xh,82,82 -v v -A  prog.nc east.nc
ncap2 -A -s 'v(:,:,0:1,:)=0; v(:,:,19:20,:)=0; v(:,:,2,:)=h(:,:,2,:); v(:,:,18,:)=h(:,:,17,:); v(:,:,3:17,:)=0.5*(h(:,:,2:16,:)+h(:,:,3:17,:))' east.nc east.nc
ncrename -v h,dz_salt_segment_002 east.nc
ncrename -v v,dz_v_segment_002 east.nc
