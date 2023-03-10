***********************************************************;
*  LESSON 4, PRACTICE 4                                   *;
*    a) Create a new column named SqMiles by multiplying  *;
*       Acres by .0015625.                                *;
*    b) Create a new column named Camping as the sum of   *;
*       OtherCamping, TentCampers, RVCampers, and         *;
*       BackcountryCampers.                               *;
*    c) Format SqMiles and Camping to include commas and  *;
*       zero decimal places.                              *;
*    d) Modify the KEEP statement to include the new      *;
*       columns. Run the program.                         *;
***********************************************************;

data np_summary_update;
	set pg1.np_summary;
	*keep Reg ParkName DayVisits OtherLodging Acres;	
	*Add assignment statements;
	SqMiles=Acres*0.0015625;
	Camping=sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	format SqMiles comma6. Camping comma10.
run;

data eu_occ_total;
	set pg1.eu_occ;
	Year = substr(YearMon,1,4);
	Month =substr(YearMon,6,2);
	ReportDate=MDY(Month,1,Year);
	Total=sum(Hotel,ShortStay,Camp);
	format Hotel ShortStay Camp Total comma17. ReportDate monyy7.;
	keep Country Hotel ShortStay Camp ReportDate Total;
run;