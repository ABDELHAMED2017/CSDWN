%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Main Loop Runner in parallel:
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function parallel_R_pro(pref_poolSize)
parpool(pref_poolSize)
BS_list = generate_network(120, 200, 200, 200,'mmWave',false);
BS_list_size = size(BS_list,2);

permutationsMat = zeros(50,BS_list_size);

for i=1:50
    permutationsMat(i,:) = randperm(BS_list_size,BS_list_size);
end

parfor_progress(50);
 parfor i=1:50
    runForAll(BS_list,permutationsMat(i,:),i);
    pause(rand);
    parfor_progress;
 end
 parfor_progress(0); % Clean up
end
