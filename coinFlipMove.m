clear;clc;clf;

d = []; % vector to track distance

avgV = []; % vector to track averages of all distances 

coinFlipAmount = input("How many coins to flip in 1 trial?\n");
timesToRun = input("How many trials to run?\n");

steps = 0; % tracks how many steps forwards/backwards have been taken
for j = 1:timesToRun
    
    %%% steps forwards or backwards randomly based on coinFlipAmount
    for i = 1:coinFlipAmount
        if (randi([0 1]) == 0) % step backwards
            d = [d, steps--];
        else % step forwards
            d = [d, steps++];
        endif
    endfor
    
    %%% adds the mean distance to the vector
    avgV = [avgV, mean(d)];
    
    %%% plots data
    plot(d, "linewidth", 1.3)
    hold on;
    xlabel("Time"); ylabel("Distance From Starting Point"); 
    xlim([0 coinFlipAmount]);
    
    %%% resets distance vector
    d = [];
    
endfor

%%% prints output
fprintf("Average distance moved of all %i trials was %i", timesToRun, mean(avgV))

%%% plots mean as a vector
plot(repmat(mean(avgV), coinFlipAmount, 1), "linewidth", 4);
