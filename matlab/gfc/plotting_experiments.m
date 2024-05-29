
% load the repository's example data 
load("graf.mat")

% this is the call they make in demo.m using 
% X and Y variables from "graf.mat"
% these variables are 2D arrays
delta = 0.5;
[idt, V, param] = GFC(X, Y, delta);
    
if false 
    % indicies given in function results
    disp(idt);
end
    

if false    
    % X, Y and Z are two dimensional arrays
    % plotting like this gives two lines
    hold on
    plot(X)
    plot(Y)
    plot(V)
    hold off
end

if false
    % plotting as points
    x1 = X(1:844,1);
    x2 = X(1:844,2);
    y1 = Y(1:844,1);
    y2 = Y(1:844,2);
    hold on 
    plot(x1,x2, 'b.');
    plot(y1,y2, 'r.');
    hold off
end

if false
    % the first column of X and Y are similar 
    hold on
    xSize = size(X)
    ySize = size(Y)
    plot(X(1:xSize(1),1))
    plot(Y(1:ySize(1),1))
    hold off
end 

if false
    % the second column of X and Y are also similar 
    hold on
    xSize = size(X)
    ySize = size(Y)
    plot(X(1:xSize(1),2))
    plot(Y(1:ySize(1),2))
    hold off
end 

% X and V are identical
if false
    % first column of both are identical
    hold on
    plot(X(1:300,1), 'r')
    % plot(Y(1:300,2), 'b')
    plot(V(1:300,1), 'g')   
    hold off
end 

if false
    % second column of both are identical
    hold on
    plot(X(1:300,2), 'r')
    % plot(Y(1:300,2), 'b')
    plot(V(1:300,2), 'g')
    hold off
end 

if false
    % combined indentical
    hold on
    plot(X)
    plot(V)
    hold off
end 