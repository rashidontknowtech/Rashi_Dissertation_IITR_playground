% Prepare Himalayan earthquake data and save it as a .mat file
% Manually enter the required data for 52 events.

clear; clc;

%%Step 1: Manually Enter Data (Refer to Prof. Raghukanth's research paper)
%Enter data for 52 events
eventID = (1:52)';  % Assign unique event IDs
date = ["14-12-2005"; "10-12-2006"; "22-07-2007"; "04-10-2007"; "13-03-2008"; "29-05-2008"; "19-08-2008"; "04-09-2008"; "06-09-2008"; "21-10-2008"; "25-12-2008"; "03-01-2009"; "09-01-2009"; "31-01-2009"; "25-02-2009"; "25-04-2009"; "15-05-2009"; "17-07-2009"; "19-08-2009"; "27-08-2009"; "21-09-2009"; "03-10-2009"; "22-10-2009"; "29-10-2009"; "06-12-2009"; "31-12-2009"; "11-01-2010"; "22-02-2010"; "26-02-2010"; "14-03-2010"; "01-05-2010"; "03-05-2010"; "28-05-2010"; "31-05-2010"; "06-07-2010"; "10-07-2010"; "26-07-2010"; "17-09-2010"; "21-03-2011"; "04-04-2011"; "04-05-2011"; "20-06-2011"; "18-09-2011"; "22-09-2011"; "16-01-2012"; "09-02-2012"; "26-02-2012"; "11-05-2012"; "10-07-2012"; "12-07-2012"; "28-07-2012"; "23-08-2012"]; % Manually enter 52 dates as strings

lat = [30.9; 31.5; 31.2; 32.5; 26.6; 26.6; 30.1; 30.1; 36.7; 31.5; 27.2; 36.5; 31.7; 32.5; 30.6; 26.4; 30.5; 32.3; 26.6; 30; 30.9; 30; 36.5; 26.6; 35.8; 27.3; 29.7; 30; 28.5; 31.7; 29.9; 30.4; 31.2; 30; 29.8; 29.9; 26.5; 36.5; 36.5; 29.6; 30.2; 30.5; 27.6; 27.6; 29.7; 30.9; 29.6; 26.6; 26.5; 36.5; 29.7; 28.4]; %Enter 52 latitude values
lon = [79.3; 76.7; 78.2; 76; 91.8; 91.8; 80.1; 80.4; 70.6; 77.3; 87.9; 70.8; 78.3; 75.9; 79.3; 91.7; 79.3; 76.1; 92.5; 80; 79.1; 79.9; 71; 90; 77.3; 91.4; 80; 80.1; 86.7; 76.1; 80.1; 78.4; 77.9; 79.8; 80.4; 79.6; 91.3; 70.8; 70.9; 80.8; 80.4; 79.4; 88.2; 88.4; 78.9; 78.2; 80.8; 93; 93.2; 70.9; 80.7; 82.7]; %Enter 52 longitude values
Mw = [5.2; 3.5; 5; 3.8; 4; 4.2; 4.3; 5.1; 5.8; 4.5; 4.4; 6.4; 3.8; 3.7; 3.7; 4; 4.1; 3.7; 3.7; 3.9; 4.7; 4.3; 6.3; 4.2; 5.3; 5.5; 3.9; 4.7; 5.4; 4.6; 4.6; 3.5; 4.8; 3.6; 5.1; 4.1; 4.1; 6.5; 5.7; 5.7; 5; 4.6; 6.8; 3.9; 3.6; 5; 4.3; 5.4; 4.5; 6.3; 4.5; 5]; % Enter 52 Magnitude values

% Compute Jb Distance using reference location (mean lat/lon of events)
referenceLat = mean(lat);
referenceLon = mean(lon);
jbDistance = zeros(52,1);
for i = 1:52
    jbDistance(i) = haversine(lat(i), lon(i), referenceLat, referenceLon);
end

% Leave Sa, Ss, Fn, Fr Empty (Not used)
Sa = [];
Ss = [];
Fn = [];
Fr = [];

% Estimate PGA using a Simple Ground Motion Prediction Equation (GMPE)
PGA = 10.^(0.5 * Mw - log10(jbDistance + 1));

%% Step 2: Save Data as a .mat File
save('himalayan_data.mat', 'eventID', 'date', 'lat', 'lon', 'Mw', 'jbDistance', 'PGA', 'Sa', 'Ss', 'Fn', 'Fr');

disp('Himalayan earthquake data saved as himalayan_data.mat');

%% Haversine Distance Function
function d = haversine(lat1, lon1, lat2, lon2)
    R = 6371; % Earth's radius in km
    dLat = deg2rad(lat2 - lat1);
    dLon = deg2rad(lon2 - lon1);
    a = sin(dLat/2).^2 + cos(deg2rad(lat1)) .* cos(deg2rad(lat2)) .* sin(dLon/2).^2;
    c = 2 * atan2(sqrt(a), sqrt(1-a));
    d = R * c; % Distance in km
end
