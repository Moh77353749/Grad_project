function soh = SOH_Calc(cur)

%   this code will mainly count the number of cycles of charging-discharging and calculte the new total capacity of the
%   batteries per the following paper
%   (https://doi.org/10.1063/1.5012602). the calculations is mainly based
%   on an experimental results and curve fitting for the relation between the normalized capacity and the number of cycles 
old_dir=1;num_cycles=0; %%main script of the project as it needs to run only once at the begaining.
current_dir=cur/cur;
if  old_dir ~= current_dir
    if (old_dir== -current_dir) %for dis-charging
        num_cycles=1;%count number of cycles
        old_dir=current_dir; %%change the direction for the next loop
    end
end

if(num_cycles>10)
    rated_capacity=27.625;
    normaliz_capacity=(-3.72420611065173e-15*num_cycles^6+	3.75024849118566e-12 *num_cycles^5	-1.44810117823229e-09*num_cycles^4+	2.64463491236913e-07*num_cycles^3	-2.23630419461362e-05 *num_cycles^2+	0.000381471576336523*num_cycles^1+0.984192557022104)*rated_capacity;
    soh=normaliz_capacity/rated_capacity;
end
end




%% Load Dataset
load('simulation results.mat')

%% SOH calcultions
num_cyc=0;
flag1=0;
flag2=0;
thershold=0.9;
soc=out.Soc;
for i=0:1:length(soc)
    diff=thershold-soc(i);
    if (soc(i)>0.9 && flag1==0)
        flag1=1;
        old_soc=soc(i-1);
    elseif(soc(i)<0.1 && flag2==0 && flage1==1)
        flag2=1;
        
    end

end