%------------------------------------------------------------------------%
clc;clear;close all;
%------------------------------------------------------------------------%

x = [0.3039 0.6168 0.7128 0.7120 0.9377 0.7120 0.3989,...
    0.3028 0.3036 0.5293 0.3039];
y = [0.1960 0.2977 0.4169 0.1960 0.2620 0.5680 0.6697,...
    0.7889 0.5680 0.5020 0.1960];

n = length(x);

P = [x;y;ones(1,n)];

dx = 0.1827 + 0.6338;
dy = 0.8249 - 0.0809;

figure()
hold on;

%% 1st Tile

h = 0.7120;
k = 0.4320;
th = deg2rad(180);

% translation matrix

T = [...
     1 0 h
     0 1 k
     0 0 1];
 
% Rotation Matrix

R = [...
    cos(th) -sin(th) 0
    sin(th) cos(th) 0
    0 0 1
    ];

P1 = T*R*P;

x1 = P1(1,:);
y1 = P1(2,:);


fill(x1,y1,'b')

%% 2nd Tile

h = 0.3039;
k = -0.336;

% translation matrix

T = [...
     1 0 h
     0 1 k
     0 0 1];

% Flipping Matrix

F = [...
    -1 0
     0 1
    ];

PP = [F*P(1:2,:);ones(1,n)];
P2 = T*PP;

x2 = P2(1,:);
y2 = P2(2,:);


fill(x2,y2,'r')

%% 3rd Tile

h = -0.3039;
k = 0.8;

% translation matrix

T = [...
     1 0 h
     0 1 k
     0 0 1];

% Flipping Matrix

F = [...
    1 0
     0 -1
    ];

PP = [F*P(1:2,:);ones(1,n)];
P3 = T*PP;

x3 = P3(1,:);
y3 = P3(2,:);


fill(x3,y3,'r')


%% 4th Tile

h = -0.4084;
k = 0.3720;

% translation matrix

T = [...
     1 0 h
     0 1 k
     0 0 1];

% Flipping Matrix

F = [...
    -1 0
     0 1
    ];

PP = [F*P2(1:2,:);ones(1,n)];
P4 = T*PP;

x4 = P4(1,:);
y4 = P4(2,:);


fill(x4,y4,'b')

axis square

%------------------------------------------------------------------------%
%% Repeating the sequence

figure()
hold on

N = 5;
M = 3;

for i = 1:N
    for j = 1:M
% translation matrix

T = [...
     1 0 dx*i
     0 1 dy*j
     0 0 1];
    
 PP1 = T*P1;
 PP2 = T*P2;
 PP3 = T*P3;
 PP4 = T*P4;
 
fill(PP1(1,:),PP1(2,:),'b')
fill(PP2(1,:),PP2(2,:),'r')
fill(PP3(1,:),PP3(2,:),'b')
fill(PP4(1,:),PP4(2,:),'r')
 
 
    end
end

%------------------------------------------------------------------------%