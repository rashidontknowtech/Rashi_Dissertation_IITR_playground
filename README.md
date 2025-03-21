**Running Ming Deyu's scoring estimation algorithm on 52 Himalayan earthquake events - Rashi's notes**
Himalayan data reference paper: https://link.springer.com/article/10.1007/s00024-014-0807-x

**Task 1:**__
Guide to prepare data.mat for the scoring algorithm

Has the following data:
1. date
2. event latitude
3. event longitude
4. magnitude

To assign:
1. event ID

To find:
1. Jb distance using approximate station reference
2. PGA using empirical model

To remove:
3. station codes and their locations
4. Ss, Sa, Fn, Fr

**Task 2:**__
1. Prepare grid.mat file where we want to predict data
2. Prepare himalayanborder.mat for shakemap generation
3. Prepare Himalayan version of Akkar.mat to find values of τ² and σ² (for prediction) [in the reference paper, it is chosen theoretically]
4. Find generator settings for Himalayan GMPE

**Task 3:**__
1. tweak design.m code
2. tweak Bg.m code
3. tweak generator.m code
4. tweak scoring.m code
5. tweak prediction.m code
6. tweak eventfinder.m code
7. tweak semivag.m code
8. tweak shakemap.m code
9. tweak example code
