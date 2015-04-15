function [ref_current,ref_power,volt_ref_max,volt_ref_min] = powerflow(mpc)

define_constants;

alpha=2; %sets the limit for the capacity
%mpc = loadcase('case2383wp.m');



%mpopt = mpoption('PF_ALG', 1,'PF_MAX_IT',20);
%results = rundcpf(mpc, mpopt);
results=runpf(mpc);

n_bus = numel(mpc.bus(:,1));
n_branches=numel(mpc.branch(:,1));
f=mpc.branch(:,1); %registers the branches into which power injected
f=f';
generators=mpc.gen(:,1); %registers total number of generators
generators=generators';

%gives the indices of branches
k=[];
for l=1:n_branches
    k=[k;l];
end
k=k';

%caclulates the reference currents
a=[]

for t=1:n_branches
    Sf = results.branch(k(:,t), PF) + 1j * results.branch(k(:,t), QF);
    Vf = results.bus(f(:,t), VM) * exp(1j * results.bus(f(:,t), VA)*(pi/180));
    If = abs(conj( Sf / Vf )); %% complex current injected into branch k at bus f
    ref_if = alpha*If;
    a = [a; ref_if];
end
a=a';
ref_current=a;
power_ref=mpc.branch(1:n_branches,RATE_A)';
ref_power=power_ref;

%voltage_part_begin
volt_ref_max=mpc.bus(1:n_bus,VMAX)';
volt_ref_min=mpc.bus(1:n_bus,VMIN)';

end

