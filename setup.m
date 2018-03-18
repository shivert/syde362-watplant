dos_command = '"C:\Program Files (x86)\PC-Progress\HYDRUS 2.xx\H2D_Calc.exe" "C:\Users\Peter Zhang\Documents\syde362-watplant\H3D2_SYDE 362"';
numNodes = 752;
rootZone = 0.11;
meshPath = "C:\Users\Peter Zhang\Documents\syde362-watplant\SYDE 362_Mesh.txt";
mesh_node_lookup = [3 23 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 2]; % node numbers along the top
avgNodeArea = 0.45; %use equilateral triangle of height 1cm as approx
diameter = length(mesh_node_lookup)-1;
domainDAT="C:\Users\Peter Zhang\Documents\syde362-watplant\H3D2_SYDE 362\DOMAIN.DAT"; 
boundaryIN = "C:\Users\Peter Zhang\Documents\syde362-watplant\H3D2_SYDE 362\BOUNDARY.IN";
dimensionIN = "C:\Users\Peter Zhang\Documents\syde362-watplant\H3D2_SYDE 362\DIMENSIO.IN";

outputPath = "C:\Users\Peter Zhang\Documents\syde362-watplant\H3D2_SYDE 362\th.out";