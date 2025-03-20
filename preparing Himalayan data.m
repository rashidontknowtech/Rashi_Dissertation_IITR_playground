% Prepare Himalayan earthquake data and save it as a .mat file
% Manually enter the required data for 52 events.

clear; clc;

%% Step 1: Manually Enter Data (Refer to Prof. Raghukanth's research paper)
% Enter data for 52 events
eventID = (1:52)';  % Assign unique event IDs
date = ["YYYY-MM-DD"; "YYYY-MM-DD"; ...]; % Manually enter 52 dates as strings

lat = [LAT1; LAT2; LAT3; ...]; % Enter 52 latitude values
lon = [LON1; LON2; LON3; ...]; % Enter 52 longitude values
Mw = [MW1; MW2; MW3; ...]; % Enter 52 Magnitude values

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
