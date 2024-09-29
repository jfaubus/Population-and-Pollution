
%all cities were chosen for their varied values for population and number
%of of manufacturing companies employing 20 or more workers. Additionally,
%they had a wide range of values for precipation per year. They all have
%pretty close values for temperature which is good because it can act as a
%constant
%Wilmington chosen for its low population and high precipation
Wilmington =	[36,	54,	80,	80,	9,	40.25,	114];
%Wichita chosen for its slightly higher population yet lower precipitation
Wichita	= [8,	56.6,	125,	277,	12.7,	30.58,	82];
%phoenix chosen for having a mid range value for population
phoenix = [10,	70.3,	213,	582,	6,	7.05,	36];
%Baltimore chosen for its large population
Baltimore	= [47,	55,	625,	905,	9.6,	41.31,	111];
%Detroit chosen for having the largest population
Detroit	= [35,	49.9,	1064,	1513,	10.1,	30.96,	129];


%gives an array of colors
colors = ["blue", "red", "green", "yellow", "magenta"];
%gives an array of the titles in order
titles = [ "Y vs X1", "Y vs X2", "Y vs X3", "Y vs X4", "Y vs X5", "Y vs X6"];
%gives the array of the x-axis in order
label = [0, "Average Annual Temp (F)", "Number of Manufacturing enterprise employing 20+ workers", "Population Size (1970) in thousands", "Average Annual Wind Speed (mi/hr)", "Average Annual Precipitation (inches)", "Average Number of Days with Precipitation per year"];
%gives an array of strings explaining each slop
slope = ["The slope of the best-fit line to the pollution vs. temperature data is: %f\n", "The slope of the best-fit line to the pollution vs. Manufacturing enterprise employing 20+ workers data is:%f\n", "The slope of the best-fit line to the pollution vs. population size data is:%f\n", "The slope of the best-fit line to the pollution vs. average annual rainfall data is:%f\n", "The slope of the best-fit line to the pollution vs. average annual precipitation data is:%f\n",  "The slope of the best-fit line to the pollution vs. average number of days with precipitation per year data is:%f\n" ];

%begins a for loop that loops through the numbers 1 to 5
for i = 1:6
   %establishes that everything below will be on the left side of a figure
   figure(1)
   %with 5 x 2 dimensions
   subplot(3, 2, i)
   %begins a nested for loop
   for j = 1:5
      %array with the x values of each city
     cities = [Wilmington(i + 1), Wichita(i + 1), phoenix(i + 1), Baltimore(i +1 ), Detroit(i +1)];
     %array with the y value of each city
     y = [Wilmington(1), Wichita(1), phoenix(1), Baltimore(1), Detroit(1)];
     %scatters the same x value for each city
     scatter(cities(j), y(j), colors(j))
     
     hold on
   end
   %sets the ylabel
   ylabel(["SO2 in the Air", "(mg/m^3)"], FontSize=8);
   %returns the slope of the lines + y-intercept
   p = polyfit(cities(1:5), y(1:5), 1);
   %determines the points on the best fit line
   val = polyval(p, cities(1:5));
   %plots the best fit line
   plot(cities(1:5), val);
   %labels the x-axis
   xlabel([label(i+1)]);
   %gives each graph a title
   title([titles(i)]);
    %prints the slope
   fprintf(slope(i), p(1));

   
   hold off
end

legends = legend("Wilmington", "Wichita", "phoenix", "Baltimore", "Detroit");
set(legends,'location', 'bestoutside');

%array of y-axis title for boxplot
label2 = [0, "Temp (F)", "Manufacturing enterprises", "Population Size", "Annual Wind Speed (mi/hr)", "Annual Precipitation", "Days of Precipitation"];
figure(2)
for i = 1:6
    %adds everything below to the right hand side of the figure
   subplot(3, 2, i)
   for j = 1:5
       %x values of the cities for that iteration
     cities = [Wilmington(i), Wichita(i), phoenix(i), Baltimore(i), Detroit(i)];
     %creates the boxplot
     boxplot(cities)
     hold on
   end
   %gives the boxplots a title
   title(label(i+1))
   %labels the y-axis of the boxplots
   ylabel(label2(i+1), FontSize=8)
   hold off
end

