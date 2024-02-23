OUTPUT('Hello Hackers!');
// Pickup_Layout := RECORD
//     STRING10 pickup_date;
//     DECIMAL8_2 fare;
//     DECIMAL8_2 distance;
// END;

// Pickup_DS := DATASET([{'2015-01-01', 25.10, 5}], Pickup_Layout);

// crossTableLayout := RECORD
//     Pickup_DS.pickup_date;
//     avgFare := AVE(GROUP, Pickup_DS.fare);
//     totalFare := SUM(GROUP, Pickup_DS.fare);
// END;
// crossTabDs := TABLE(Pickup_DS, crossTabLayout, pickup_date)
// OUTPUT()